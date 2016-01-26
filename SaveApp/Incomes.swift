//
//  Incomes.swift
//  SaveApp
//
//  Created by Aitor Pagán on 25/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData

@objc(Incomes)
class Incomes: NSManagedObject {

    @NSManaged var concept: String?
    @NSManaged var quantity: NSNumber?
    @NSManaged var dateIncome: NSDate?
    
    

}
