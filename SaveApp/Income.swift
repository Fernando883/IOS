//
//  Incomes.swift
//  SaveApp
//
//  Created by Aitor Pagán on 24/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class Income: NSObject {
    
    //MARK: Properties
    
    var concept: String
    var quantity: String
    var dateIncome: String
    
    init(concept: String, quantity: String, dateIncome: String){
        
        self.concept = concept
        self.quantity = quantity
        self.dateIncome = dateIncome
        
    }

}
