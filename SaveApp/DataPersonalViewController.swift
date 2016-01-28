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
    
    let userFacade = UserFacade()
    var idUser: NSNumber?
    let communicationFacade = CommunicationFacade()
    
    @IBOutlet weak var NicknameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signIn.layer.cornerRadius=10
        signIn.layer.borderWidth = 5
        
        signUp.layer.cornerRadius=10
        signUp.layer.borderWidth = 5
        logIn.font = UIFont (name: "Bradley Hand", size: 50)
        // Do any additional setup after loading the view.
        
        NicknameTextField.autocorrectionType = .No
        NicknameTextField.autocapitalizationType = .None
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignIn(sender: UIButton) {
        
        let nickIntroduced : String = NicknameTextField.text!
        let passwordIntroduced : String = PasswordTextField.text!
        idUser = communicationFacade.checkLogin(nickIntroduced, password: passwordIntroduced)
        //print("\n\n\n",idUser.stringValue,"\n\n\n")
    }

    
    // MARK: - Navigation
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        let alert = UIAlertView()
        alert.title = "Error"
        
        alert.addButtonWithTitle("OK")
        if idUser?.integerValue == -1{
            alert.message = "Invalid Password"
            alert.show()
            return false
        }else if idUser?.integerValue == -2{
            alert.message = "Invalid User"
            alert.show()
            return false
        }else{
            let nickname = NicknameTextField.text
            let password = PasswordTextField.text
            userFacade.saveUser(idUser!, nickname: nickname!, password: password!)
            return true
        }
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "validLoginSegue"{
            
        }
        
    }


}
