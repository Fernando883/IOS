//
//  outgoesFacade.swift
//  SaveApp
//
//  Created by Aitor Pagán on 26/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class OutgoesFacade{
    
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    func saveOutgo (concept: String, quantity: Float?, dateOutgo: NSDate, type: String){
        
        let outgo = NSEntityDescription.insertNewObjectForEntityForName("Outgoes", inManagedObjectContext: managedContext) as! Outgoes
        
        outgo.concept = concept
        outgo.quantity = quantity
        outgo.dateOutgo = dateOutgo
        outgo.type = type
        try! managedContext.save()
        
    }
    
    
    func getOutgoes() -> [Outgoes]{
        
        let fetchRequest = NSFetchRequest(entityName: "Outgoes")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [Outgoes]
        
        return results
        
    }
}