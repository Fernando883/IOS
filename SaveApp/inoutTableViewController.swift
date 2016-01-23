//
//  incomesViewController.swift
//  SaveApp
//
//  Created by noussair el harrak on 23/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class inoutTableViewController: UITableViewController {

    var outgo: Bool?
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var addIncomeButton: UIBarButtonItem!
    @IBOutlet weak var addOutgoButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if outgo == true{
            navigationBar.rightBarButtonItems?.removeFirst()
        }else if outgo == false{
            navigationBar.rightBarButtonItems?.popLast()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
    }
    

}
