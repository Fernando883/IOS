//
//  CollaboratorTableViewCell.swift
//  SaveApp
//
//  Created by MacBooKPro on 22/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class CollaboratorTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nameOffer: UILabel!
    @IBOutlet weak var photoOffer: UIImageView!
    @IBOutlet weak var descriptionOffer: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var dateOffer: UILabel!
    @IBOutlet weak var ratingControlOffer: RatingControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
