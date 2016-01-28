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
    
    func insertOutgo (idoutgo: Int,concept: String, quantity: Float?, dateOutgo: NSDate, type: String){
        
        let outgo = NSEntityDescription.insertNewObjectForEntityForName("Outgoes", inManagedObjectContext: managedContext) as! Outgoes
        
        outgo.concept = concept
        outgo.quantity = quantity
        outgo.dateOutgo = dateOutgo
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
        var outgoes = [Outgoes]()
        var i: Int=1
        let outgo = NSEntityDescription.insertNewObjectForEntityForName("Outgoes", inManagedObjectContext: managedContext) as! Outgoes
       // print("holaaaanoussairrrr",data.count)
        for outg in data{
            print(outg["concepto"])
            outgo.concept = outg["concepto"] as? String
            print("holaaaaaaa")
            outgo.quantity = outg.valueForKey("cantidad")!.integerValue
            let fecha = outg["fecha"] as! String
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            outgo.dateOutgo = dateFormatter.dateFromString(fecha)
            print(outg)
            outgo.id_Outgo = outg.valueForKey("idGasto")!.integerValue
            outgo.type = outg["tipo"] as? String
            //income = income.newIncome(concepto, quantity: cantidad, dateIncome: date!, id_Income: idIncome)
            outgoes.append(outgo)
        }
        
        return outgoes
    }
    
    func loadFromWebService(idUser: NSNumber){
        
        let json = communicationFacade.getOutgoesFromUser(idUser)
        
        let outgoes = convertJsontoArrayOutgoes(json)

        /*for(var i=0; i < outgoes.count; ++i){
            insertOutgo((outgoes[i].id_Outgo?.integerValue)!, concept: outgoes[i].concept!, quantity: outgoes[i].quantity?.floatValue, dateOutgo: outgoes[i].dateOutgo!, type: outgoes[i].type!)
            print("\n\n\n",outgoes[i].concept,"\n\n\n")
        }*/
        
        for outgo in outgoes{
            print("\n\n\n",outgo.concept,"\n\n\n")
//            
//            try! managedContext.save()
//           // insertOutgo((outgo.id_Outgo?.integerValue)!, concept: outgo.concept!, quantity: outgo.quantity?.floatValue, dateOutgo: outgo.dateOutgo!, type: outgo.type!)
//            
      }
        
    }
}