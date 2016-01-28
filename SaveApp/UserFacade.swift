//
//  UserFacade.swift
//  SaveApp
//
//  Created by noussair el harrak on 28/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class UserFacade{
    
    let managedContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    func saveUser(id_User: NSNumber, nickname: String, password: String){
        let user = NSEntityDescription.insertNewObjectForEntityForName("User", inManagedObjectContext: managedContext) as! User
        
        user.id_user = id_User
        user.nickname = nickname
        user.password = password
        
        try! managedContext.save()
    }
    
    func getNickname() -> String{
        
        let fetchRequest = NSFetchRequest(entityName: "User")
 
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [User]
        
        return results[1].nickname!
    }
    
    func getPassword() -> String{
        
        let fetchRequest = NSFetchRequest(entityName: "User")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [User]
        
        return results[1].password!
    }
    
    func getIdUser() -> Int{
        
        let fetchRequest = NSFetchRequest(entityName: "User")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [User]
        
        if (results.count + 1) < 2 {
            return 0
            
        }else{
            return (results[1].id_user?.integerValue)!
        }
        
        
    }
    
    func deleteAll(){
        
        let fetchRequest = NSFetchRequest(entityName: "User")
        
        let results = try! managedContext.executeFetchRequest(fetchRequest) as! [User]
        
        for user in results{
            managedContext.deleteObject(user)
        }
        
        
        
    }
    
}