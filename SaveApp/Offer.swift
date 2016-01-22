//
//  Offer.swift
//  SaveApp
//
//  Created by MacBooKPro on 22/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit


class Offer: NSObject{
    
    var id: Int?
    var name: String
    var photo: UIImage?
    var descriptionOffer: String
    var rating: Int
    var validDate: String
    var price: String
    
    init(name:String, photo: UIImage?, descriptionOffer: String, rating: Int, validDate: String, price: String) {
        self.name = name
        self.photo = photo
        self.descriptionOffer = descriptionOffer
        self.rating = rating
        self.validDate = validDate
        self.price = price
    }
}
