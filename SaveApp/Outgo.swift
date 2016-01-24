//
//  Outgo.swift
//  SaveApp
//
//  Created by Aitor Pagán on 24/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class Outgo: NSObject {
    
    //MARK: Properties
    
    var concept: String
    var quantity: String
    var dateOutgo: String
    
    init(concept: String, quantity: String, dateOutgo: String){
        
        self.concept = concept
        self.quantity = quantity
        self.dateOutgo = dateOutgo
        
    }

}
