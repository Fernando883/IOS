//
//  IncomesFacade.swift
//  SaveApp
//
//  Created by Aitor Pagán on 26/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class IncomesFacade{
    
     let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    func saveIncome (concept: String, quantity: Float?, dateIncome: NSDate){
        
        let income = NSEntityDescription.insertNewObjectForEntityForName("Incomes", inManagedObjectContext: managedContext) as! Incomes
        
        income.concept = concept
        income.quantity = quantity
        income.dateIncome = dateIncome
        
        try! managedContext.save()
        
    }
    
    
    func getIncomes() -> [Incomes]{
        
        let fetchRequest = NSFetchRequest(entityName: "Incomes")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [Incomes]
        
        return results
        
    }
    
}