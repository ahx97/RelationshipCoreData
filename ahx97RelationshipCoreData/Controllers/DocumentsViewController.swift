//
//  DocumentsViewController.swift
//  ahx97RelationshipCoreData
//
//  Created by Aaron Henry on 9/26/19.
//  Copyright © 2019 Aaron Henry. All rights reserved.
//

import UIKit

class DocumentsViewController: UIViewController {

    @IBOutlet weak var DocumentsTableView: UITableView!
    
    var category: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func savedocument(_ sender: Any) {
        performSegue(withIdentifier: "showDocument", sender: self)
    }
    
}

extension DocumentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DocumentsTableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath)
        
        return cell
    }
}

extension DocumentsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDocument", sender: self)
    }
}
