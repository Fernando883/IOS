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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let inoutViewController = segue.destinationViewController as! inoutTableViewController
        if segue.identifier == "incomesTableSegue"{
            
            inoutViewController.outgo = false
            inoutViewController.navigationBar.title = "Incomes"
            
        }else if segue.identifier == "outgoTableSegue"{
            inoutViewController.outgo = true
            inoutViewController.navigationBar.title = "Outgoes"
        }
        
        
    }
    

}
