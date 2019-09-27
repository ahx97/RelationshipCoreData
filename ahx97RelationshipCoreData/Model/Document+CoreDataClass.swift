//
//  Document+CoreDataClass.swift
//  ahx97RelationshipCoreData
//
//  Created by Aaron Henry on 9/26/19.
//  Copyright © 2019 Aaron Henry. All rights reserved.
//
//

import UIKit
import CoreData

@objc(Document)
public class Document: NSManagedObject {
    var date: Date? {
        get {
            return rawDate as Date?
        }
        set {
            rawDate = newValue as NSDate? as Date?
        }
    }
    
    convenience init(title: String?, body: String?, date: Date?) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        
        let context = appDelegate?.persistentContainer.viewContext
        
        self.init(entity: Document.entity(), insertInto: context)
        
        self.title = title
        self.body = body
        self.date = date
    }

}
