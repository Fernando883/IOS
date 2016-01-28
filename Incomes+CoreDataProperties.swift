//
//  Incomes+CoreDataProperties.swift
//  SaveApp
//
//  Created by MacBooKPro on 27/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Incomes {

    @NSManaged var concept: String?
    @NSManaged var dateIncome: NSDate?
    @NSManaged var quantity: NSNumber?
    @NSManaged var idIcome: NSNumber?

}
