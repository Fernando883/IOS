//
//  User+CoreDataProperties.swift
//  SaveApp
//
//  Created by MacBooKPro on 28/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

class User: NSManagedObject{

    @NSManaged var id_user: NSNumber?
    @NSManaged var nickname: String?
    @NSManaged var password: String?

}
