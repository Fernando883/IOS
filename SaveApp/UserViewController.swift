//
//  UserViewController.swift
//  SaveApp
//
//  Created by noussair el harrak on 22/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    //MARK: Properties
    @IBOutlet weak var incomesImage: UIImageView!
    @IBOutlet weak var outgoesImage: UIImageView!
    @IBOutlet weak var notificationImage: UIImageView!
    
    @IBOutlet weak var balanceImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       balanceImage.image = UIImage(named: "BalanceIncomes")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Actions
    
    @IBAction func openIncomes(sender: UITapGestureRecognizer) {
        if sender.isEqual(incomesImage){
            
        }
    }

    @IBAction func openOffers(sender: UIBarButtonItem) {

    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            if segue.identifier == "incomesTableSegue"{
                
                let inoutViewController = segue.destinationViewController as! inoutTableViewController
            
                inoutViewController.outgo = false
                inoutViewController.navigationBar.title = "Incomes"
            
            }else if segue.identifier == "outgoTableSegue"{
                
                let inoutViewController = segue.destinationViewController as! inoutTableViewController
            
                inoutViewController.outgo = true
                inoutViewController.navigationBar.title = "Outgoes"
                
            }else if segue.identifier == "offersViewSegue"{
               // let offerViewController = segue.destinationViewController as! CollaboratorTableViewController
                
                
        }
        
    }

}
