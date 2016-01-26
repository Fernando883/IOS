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
        outgo.dateIncome = dateIncome
        
        try! managedContext.save()
        
    }
    
    
    func getIncomes() -> [Incomes]{
        
        let fetchRequest = NSFetchRequest(entityName: "Incomes")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [Incomes]
        
        return results
        
}
   