//
//  WelcomeViewController.swift
//  SaveApp
//
//  Created by MacBooKPro on 28/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var buttonEnter: UIButton!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var welcome: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonEnter.layer.cornerRadius = 10
        buttonEnter.layer.borderWidth = 5
        welcome.font = UIFont (name: "Bradley Hand", size: 50)
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
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
