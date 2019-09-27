//
//  CatagoriesViewController.swift
//  ahx97RelationshipCoreData
//
//  Created by Aaron Henry on 9/26/19.
//  Copyright © 2019 Aaron Henry. All rights reserved.
//

import UIKit
import CoreData

class CatagoriesViewController: UIViewController {

    @IBOutlet weak var CatagoriesTableView: UITableView!
    
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        
        do{
           categories = try managedContext.fetch(fetchRequest)
            
            CatagoriesTableView.reloadData()
            
        } catch{
            print("couldnt fetch")
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DocumentsViewController, let selectedRow = self.CatagoriesTableView.indexPathForSelectedRow?.row else {
            return
        }
        
        destination.category = categories[selectedRow]
        
    }
    
    func deleteCatagory(at indexPath: IndexPath){
        let category = categories[indexPath.row]
        
        guard let managedContext = category.managedObjectContext else{
            return
        }
        managedContext.delete(category)
        
        do{
            try managedContext.save()
            
            categories.remove(at: indexPath.row)
            
            CatagoriesTableView.deleteRows(at: [indexPath], with:  .automatic)
        } catch {
            print("could not delete")
            
            CatagoriesTableView.reloadRows(at: [indexPath], with: .automatic)
        }
    }
    
    
    
}

extension CatagoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CatagoriesTableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.title
        
        return cell
    }
    
    internal func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteCatagory(at: indexPath)
        }
    }
    
}
