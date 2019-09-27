//
//  NewCategoryViewController.swift
//  ahx97RelationshipCoreData
//
//  Created by Aaron Henry on 9/26/19.
//  Copyright © 2019 Aaron Henry. All rights reserved.
//

import UIKit

class NewCategoryViewController: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveCategory(_ sender: Any) {
        let catagory = Category(title: titleTextField.text ?? "")
            
            do{
                try catagory?.managedObjectContext?.save()
                
                self.navigationController?.popViewController(animated: true)
                
            } catch{
                print("could not save catagory")
            }
    }
    
}

extension NewCategoryViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
