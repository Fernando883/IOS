//
//  Outgoes.swift
//  SaveApp
//
//  Created by MacBooKPro on 27/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData

@objc(Outgoes)
class Outgoes: NSManagedObject {
    
    @NSManaged var concept: String?
    @NSManaged var dateOutgo: NSDate?
    @NSManaged var quantity: NSNumber?
    @NSManaged var type: String?
    @NSManaged var id_Outgo: NSNumber?

// Insert code here to add functionality to your managed object subclass

}
