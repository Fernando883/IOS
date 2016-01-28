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
    
    func saveOutgo (newoutgo: Outgoes, index: NSIndexPath){
        
        var outgoes = getOutgoes()
        
        outgoes[index.row] = newoutgo
        
        try! managedContext.save()
    }
    
    func insertOutgo (concept: String, quantity: Float?, dateOutgo: NSDate, type: String){
        
        let outgo = NSEntityDescription.insertNewObjectForEntityForName("Outgoes", inManagedObjectContext: managedContext) as! Outgoes
        
        outgo.concept = concept
        outgo.quantity = quantity
        outgo.dateOutgo = dateOutgo
        outgo.type = type
        
        let outgoes = getOutgoes()
        var newid = 1
        newid = (outgoes[outgoes.count - 1].id_Outgo?.integerValue)! + 1
        
        outgo.id_Outgo = newid
        
        try! managedContext.save()
    }
    
    
    func getOutgoes() -> [Outgoes]{
        
        let fetchRequest = NSFetchRequest(entityName: "Outgoes")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [Outgoes]
        
        return results
        
    }
    
    func deleteOutgoes(indexDelete: Int){
        
        var results = getOutgoes()
        
        let deleteObject = results.removeAtIndex(indexDelete)
        
        managedContext.deleteObject(deleteObject)
        
        try! managedContext.save()
        
    }
    
    func getTotal() -> Float{
        
        let fetchRequest = NSFetchRequest(entityName: "Outgoes")
        
        let result = try! managedContext.executeFetchRequest(fetchRequest) as! [Outgoes]
        
        var i = 0
        var total: Float = 0.0
        
        
        for (i=0; i < result.count; i++){
            total = total + (result[i].quantity?.floatValue)!
        }
        
        return total
        
    }
}