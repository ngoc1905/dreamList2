//
//  ItemType+CoreDataProperties.swift
//  dreamList2
//
//  Created by Ngoc Duong Phan on 11/5/16.
//  Copyright © 2016 Ngoc Duong Phan. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
