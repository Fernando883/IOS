//
//  DataPersonalViewController.swift
//  SaveApp
//
//  Created by INFTEL 05 on 26/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class DataPersonalViewController: UIViewController {

    
    
    @IBOutlet weak var logIn: UILabel!
    @IBOutlet weak var signIn: UIButton!
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signIn.layer.cornerRadius=10
        signIn.layer.borderWidth = 5
        
        signUp.layer.cornerRadius=10
        signUp.layer.borderWidth = 5
        logIn.font = UIFont (name: "Bradley Hand", size: 50)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
