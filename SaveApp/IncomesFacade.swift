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
    
    let communicationFacade = CommunicationFacade()
    
    
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
        newid = (incomes[incomes.count - 1].id_Income?.integerValue)! + 1
        
        income.id_Income = newid
        
        try! managedContext.save()
    }
    
    func insertIncome (idincome: Int,concept: String, quantity: Float?, dateIncome: String){
        
        let income = NSEntityDescription.insertNewObjectForEntityForName("Incomes", inManagedObjectContext: managedContext) as! Incomes
        
        income.concept = concept
        income.quantity = quantity
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        income.dateIncome = dateFormatter.dateFromString(dateIncome)
        income.id_Income = idincome
        
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
    
    func getTotal() -> Float{
        
        let fetchRequest = NSFetchRequest(entityName: "Incomes")
        
        let result = try! managedContext.executeFetchRequest(fetchRequest) as! [Incomes]
        
        var i = 0
        var total: Float = 0.0
        
        
        for (i=0; i < result.count; i++){
            total = total + (result[i].quantity!.floatValue)
        }
        
        return total
        
    }
    
    func convertJsontoArrayIncomes(json: AnyObject?) -> [Incomes]{
        
        let data = json as! [AnyObject]
        var incomes = [Incomes]()
        var i: Int=1
        let income = NSEntityDescription.insertNewObjectForEntityForName("Incomes", inManagedObjectContext: managedContext) as! Incomes
        print("holaaaanoussairrrr",data.count)
        for puta in data{
            print(puta["concepto"])
            income.concept = puta["concepto"] as! String
            print("holaaaaaaa")
            income.quantity = puta.valueForKey("cantidad")!.integerValue
            let fecha = puta["fecha"] as! String
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            income.dateIncome = dateFormatter.dateFromString(fecha)
            income.id_Income = puta.valueForKey("idIngreso")!.integerValue
            //income = income.newIncome(concepto, quantity: cantidad, dateIncome: date!, id_Income: idIncome)
            incomes.append(income)
        }
        
        return incomes
    }
    
    func deleteAll(){
        
        let fetchRequest = NSFetchRequest(entityName: "Incomes")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [Incomes]
        
        for outgo in results{
            managedContext.deleteObject(outgo)
        }
    }
    
    func loadFromWebService(idUser: NSNumber){
        
        let json = communicationFacade.getIncomesFromUser(idUser)
        
        let incomes = convertJsontoArrayIncomes(json)
        
        for(var i=0; i < incomes.count - 1; ++i){
            
            if let item = json[i]{
                insertIncome(item["idIngreso"] as! Int,concept: item["concepto"] as! String, quantity: item["cantidad"] as! Float, dateIncome: item["fecha"] as! String)
            
            }
        }
    }
}