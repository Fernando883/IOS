//
//  SignUpViewController.swift
//  SaveApp
//
//  Created by INFTEL 05 on 27/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {


    @IBOutlet weak var signUp: UILabel!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendButton.layer.cornerRadius = 10
        sendButton.layer.borderWidth = 5
        signUp.font = UIFont (name: "Bradley Hand", size: 50)

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
