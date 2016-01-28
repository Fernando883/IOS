//
//  Incomes.swift
//  SaveApp
//
//  Created by MacBooKPro on 27/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData

@objc(Incomes)
class Incomes: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    @NSManaged var concept: String?
    @NSManaged var dateIncome: NSDate?
    @NSManaged var quantity: NSNumber?
    @NSManaged var id_Icome: NSNumber?

}
