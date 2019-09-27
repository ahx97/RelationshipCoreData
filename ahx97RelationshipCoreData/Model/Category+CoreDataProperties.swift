//
//  Category+CoreDataProperties.swift
//  ahx97RelationshipCoreData
//
//  Created by Aaron Henry on 9/26/19.
//  Copyright © 2019 Aaron Henry. All rights reserved.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var title: String?
    @NSManaged public var rawDocuments: Document?

}
