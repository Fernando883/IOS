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
    
    
    func saveIncome (newIncome: Incomes, index: NSIndexPath){
        
        var incomes = getIncomes()
        
        incomes[index.row] = newIncome
        
        try! managedContext.save()
    }
    
    func insertIncome (concept: String, quantity: Float?, dateIncome: NSDate){
        
        let income = NSEntityDescription.insertNewObjectForEntityForName("Incomes", inManagedObjectContext: managedContext) as! Incomes
        
        income.concept = concept
        income.quantity = quantity
        income.dateIncome = dateIncome
        
        let incomes = getIncomes()
        var newid = 1
        newid = (incomes[incomes.count - 1].id_Icome?.integerValue)! + 1
        
        income.id_Icome = newid
        
        try! managedContext.save()
    }

    
    
    func getIncomes() -> [Incomes]{
        
        let fetchRequest = NSFetchRequest(entityName: "Incomes")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [Incomes]
        
        return results
        
    }
    
    func deleteIncomes(indexDelete: Int){
        
        var results = getIncomes()
        
        let deleteObject = results.removeAtIndex(indexDelete)
        
        managedContext.deleteObject(deleteObject)
        
        try! managedContext.save()
        
    }
    
}