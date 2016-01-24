//
//  inoutTableViewCell.swift
//  SaveApp
//
//  Created by Aitor Pagán on 24/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class inoutTableViewCell: UITableViewCell {
    
    //MARK: Properties

    @IBOutlet weak var conceptTextLabel: UILabel!
    @IBOutlet weak var quantityTextLabel: UILabel!
    @IBOutlet weak var dateTextLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
