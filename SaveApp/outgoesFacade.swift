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
    
    let communicationFacade = CommunicationFacade()
    
    func saveOutgo (newoutgo: Outgoes, index: NSIndexPath){
        
        var outgoes = getOutgoes()
        
        outgoes[index.row] = newoutgo
        
        communicationFacade.saveOutgoWebService(newoutgo)
        
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
    
    func insertOutgo (idoutgo: Int,concept: String, quantity: Float?, dateOutgo: String, type: String){
        
        let outgo = NSEntityDescription.insertNewObjectForEntityForName("Outgoes", inManagedObjectContext: managedContext) as! Outgoes
        
        outgo.concept = concept
        outgo.quantity = quantity
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        outgo.dateOutgo = dateFormatter.dateFromString(dateOutgo)
        outgo.type = type
        outgo.id_Outgo = idoutgo
        
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
        
        communicationFacade.deleteOutgoFromWebService(deleteObject.id_Outgo!)
        
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
    
    func deleteAll(){
        
        let fetchRequest = NSFetchRequest(entityName: "Outgoes")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [Outgoes]
        
        for income in results{
            managedContext.deleteObject(income)
        }
    }
    
    func convertJsontoArrayOutgoes(json: AnyObject?) -> [Outgoes]{
        
        let data = json as! [AnyObject]
        var outgoes2 = [Outgoes]()
        var i: Int=1
        let outgo = NSEntityDescription.insertNewObjectForEntityForName("Outgoes", inManagedObjectContext: managedContext) as! Outgoes
        
        for outg in data{
            outgo.concept = outg["concepto"] as? String
            outgo.quantity = outg.valueForKey("cantidad")!.floatValue
            let fecha = outg["fecha"] as! String
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            outgo.dateOutgo = dateFormatter.dateFromString(fecha)
            print(outg)
            outgo.id_Outgo = outg.valueForKey("idGasto")!.integerValue
            outgo.type = outg["tipo"] as? String
            //income = income.newIncome(concepto, quantity: cantidad, dateIncome: date!, id_Income: idIncome)
            outgoes2.append(outgo)
        }
        
        return outgoes2
    }
    
    func loadFromWebService(idUser: NSNumber){
        
        let json = communicationFacade.getOutgoesFromUser(idUser)
        
        let outgoes = convertJsontoArrayOutgoes(json)

        for(var i=0; i < outgoes.count - 1; ++i){
            if let item = json[i]{
                insertOutgo((item["idGasto"]) as! Int, concept: item["concepto"] as! String, quantity: item["cantidad"] as? Float, dateOutgo: item["fecha"] as! String, type: item["tipo"] as! String)
                
                
            }
            
        }
        
    }
}