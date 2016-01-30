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
            //let reply = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            callback(response!)
            
            }.resume()
        
        
    }
    
    func sendPut (callback: (AnyObject) -> Void){
        session.dataTaskWithRequest(request){(data,response,error) -> Void in
            let reply = try! NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            callback(reply)
            
            }.resume()
        
        
    }
    
    func insertIncomeWebService(concept: String, quantity: Float, dateIncome: NSDate){
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let json = ["idIngreso":"","concepto":concept, "cantidad":quantity, "fecha":dateFormatter.stringFromDate(dateIncome), "idUserIngreso":["idUser":userFacade.getIdUser(), "nickname":userFacade.getNickname(),"password":userFacade.getPassword()]]
        
        
        
        configPostRequest("model.ingresos",json: json)

        
        sendPost() { (json: AnyObject) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
            print("\n\n\n","income inserted","\n\n\n")
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
    
    func configPutRequest(query: String, id: NSNumber, json: AnyObject){
        
        let myquery = webServiceURL + query + id.stringValue
        request = NSMutableURLRequest(URL: NSURL(string: myquery)!)
        request.HTTPMethod = "PUT"
        request.HTTPBody = try! NSJSONSerialization.dataWithJSONObject(json, options: .PrettyPrinted)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    func configDeleteRequest(query: String, id: NSNumber){
        let myquery = webServiceURL + query + id.stringValue
        request = NSMutableURLRequest(URL: NSURL(string: myquery)!)
        request.HTTPMethod = "DELETE"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    func deleteOutgoFromWebService(id: NSNumber){
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        configDeleteRequest("model.gastos/",id: id)
        
        sendPost() { (json: AnyObject) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                print("\n\n\n","delete outgo correcta","\n\n\n")
            })}
        
    }
    
    func deleteIncomeFromWebService(id: NSNumber){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        configDeleteRequest("model.ingresos/",id: id)
        
        sendPost() { (json: AnyObject) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                print("\n\n\n","delete income correcta","\n\n\n")
            })}
    }
    
    func saveIncomeWebService(income: Incomes){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let json = ["idIngreso":income.id_Income!,"concepto":income.concept!, "cantidad":income.quantity!, "fecha":dateFormatter.stringFromDate(income.dateIncome!), "idUserIngreso":["idUser":userFacade.getIdUser(), "nickname":userFacade.getNickname(),"password":userFacade.getPassword()]]
        
        
        
        configPutRequest("model.ingresos/",id: income.id_Income!, json: json)
        
        
        sendPost() { (json: AnyObject) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                print("\n\n\n","income modified","\n\n\n")
            })}
    }
    
    func saveOutgoWebService(outgo: Outgoes){
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        
        let json = ["idGasto":outgo.id_Outgo!,"concepto":outgo.concept!, "cantidad":outgo.quantity!, "fecha":dateFormatter.stringFromDate(outgo.dateOutgo!), "idUserGasto":["idUser":userFacade.getIdUser(), "nickname":userFacade.getNickname(),"password":userFacade.getPassword()], "tipo":outgo.type!]
        
        
        
        configPutRequest("model.gastos/",id: outgo.id_Outgo!, json: json)
        
        
        sendPost() { (json: AnyObject) -> Void in
            dispatch_async(dispatch_get_main_queue(), {
                print("\n\n\n","outgo modified","\n\n\n")
            })}
    }
    
    func signUp(nickname: String, password: String) -> Bool{
        
        let json = ["idUser":"","nickname":nickname,"password":password]
        
        configPostRequest("model.usuario/signup", json: json)
        
        let semaphore = dispatch_semaphore_create(0)
        
        var iduser: Int?
        
        sendPut() { (response: AnyObject) -> Void in
            //dispatch_async(dispatch_get_main_queue(), {
                self.idUser = response["idUser"] as! Int
                dispatch_semaphore_signal(semaphore)
            //})
        }
        
        dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER)
        return idUser?.integerValue > -1
    }
    
    
}