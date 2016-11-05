//
//  Item+CoreDataProperties.swift
//  dreamList2
//
//  Created by Ngoc Duong Phan on 11/5/16.
//  Copyright © 2016 Ngoc Duong Phan. All rights reserved.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var title: String?
    @NSManaged public var details: String?
    @NSManaged public var price: Double
    @NSManaged public var created: NSDate?
    @NSManaged public var toStore: Store?
    @NSManaged public var toImage: Image?
    @NSManaged public var toItemType: ItemType?

}
