//
//  CommunicationFacade.swift
//  SaveApp
//
//  Created by Aitor Pagán on 26/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import UIKit
import CoreData



class CommunicationFacade{
    
    var idUser : NSNumber?
    
    let session = NSURLSession.sharedSession()
    
    var webServiceURL: String = "http://localhost:8080/saveAppWebService/webresources/"
    
    var request = NSMutableURLRequest()
    
    var reply: NSJSONSerialization?
    
    let userFacade = UserFacade()
//    
//    var semaphore: dispatch_semaphore_t?
    
    
    
    func getIncomesFromUser(id_User: NSNumber) -> AnyObject{
        
        
        var incomes: AnyObject?
        configGetRequest("model.ingresos/byuser/"+id_User.stringValue)
        let semaphore = dispatch_semaphore_create(0)
        sendRequest() { (json: AnyObject) -> Void in
            //dispatch_async(dispatch_get_main_queue(), {
                print("\n\n\n\n",json,"\n\n\n\n")
                incomes = json
                dispatch_semaphore_signal(semaphore)
            //})
        }
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return incomes!
    }
    
    func getOutgoesFromUser(id_User: NSNumber) -> AnyObject{
        
        
        var outgoes: AnyObject?
        configGetRequest("model.gastos/byuser/"+id_User.stringValue)
        let semaphore = dispatch_semaphore_create(0)
        sendRequest() { (json: AnyObject) -> Void in
            //dispatch_async(dispatch_get_main_queue(), {
            print("\n\n\n\n",json,"\n\n\n\n")
            outgoes = json
            dispatch_semaphore_signal(semaphore)
            //})
        }
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return outgoes!
    }
    
    func checkLogin(nickname: String, password: String) -> NSNumber{
    
        
        
        configGetRequest("model.usuario/login/"+nickname+"/"+password)
        let semaphore = dispatch_semaphore_create(0)
        
        sendRequest() { (json: AnyObject) -> Void in
            //dispatch_async(dispatch_get_main_queue(), {
                
                self.idUser = json.valueForKey("idUser")! as? NSNumber
                //print("\n\n\n",json,"\n\n\n")
                dispatch_semaphore_signal(semaphore!)
                
            //})
        }
        dispatch_semaphore_wait(semaphore!, DISPATCH_TIME_FOREVER)
        return idUser!
    }
    
    
    
    func configGetRequest(query: String){
        
        let myquery = webServiceURL + query
        
        request = NSMutableURLRequest(URL: NSURL(string: myquery)!)
        
        request.HTTPMethod = "GET"
        
    }
    
    
    func sendRequest (callback: (AnyObject) -> Void){
    session.dataTaskWithRequest(request){(data,response,error) -> Void in
    // let reply = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
    
    let replyJSON = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)

        callback(replyJSON)
    
    
    }.resume()
        
        
    }
    
    func sendPost (callback: (AnyObject) -> Void){
        session.dataTaskWithRequest(request){(data,response,error) -> Void in
            // let reply = NSString(data: data!, encoding: NSUTF8StringEncoding) as! String
            callback(response!)
            
            }.resume()
        
        
    }
    
    func insertIncomeWebService(concept: String, quantity: Float, dateIncome: NSDate){
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let json = ["idIngreso":"","concepto":concept, "cantidad":quantity, "fecha":dateFormatter.stringFromDate(dateIncome), "idUserIngreso":["idUser":userFacade.getIdUser(), "nickname":userFacade.getNickname(),"password":userFacade.getPassword()]]
        
        
        
        configPostRequest("model.ingresos",json: json)

        
        sendPost() { (json: AnyObject) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
            print("\n\n\n","tusmuertos","\n\n\n")
            })}
        
    }
    
    func insertOutgoWebService(concept: String, quantity: Float, dateOutgo: NSDate, type: String){
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let json = ["idGasto":"","concepto":concept, "cantidad":quantity, "fecha":dateFormatter.stringFromDate(dateOutgo), "idUserGasto":["idUser":userFacade.getIdUser(), "nickname":userFacade.getNickname(),"password":userFacade.getPassword()], "tipo":type]
        
        
        
        configPostRequest("model.gastos",json: json)
        
        
        sendPost() { (json: AnyObject) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                print("\n\n\n","insercion outgo correcta","\n\n\n")
            })}
        
    }
    
    func configPostRequest(query: String, json: AnyObject){
        
        let myquery = webServiceURL + query
        request = NSMutableURLRequest(URL: NSURL(string: myquery)!)
        request.HTTPMethod = "POST"
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    
}