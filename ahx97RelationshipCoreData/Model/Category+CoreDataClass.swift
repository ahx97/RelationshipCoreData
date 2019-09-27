//
//  Category+CoreDataClass.swift
//  ahx97RelationshipCoreData
//
//  Created by Aaron Henry on 9/26/19.
//  Copyright © 2019 Aaron Henry. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Category)
public class Category: NSManagedObject {

    var doccuments: [Document]? {
        return rawDocuments as? [Document]
    }
    
    convenience init?(title: String) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        guard let context = appDelegate?.persistentContainer.viewContext else{
            return nil
        }
        
        self.init(entity: Document.entity(), insertInto: context)
        
        self.title = title
        
    }
    
}
