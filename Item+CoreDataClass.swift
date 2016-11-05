//
//  Item+CoreDataClass.swift
//  dreamList2
//
//  Created by Ngoc Duong Phan on 11/5/16.
//  Copyright © 2016 Ngoc Duong Phan. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {
    
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate();
        
    
        
    }

}
