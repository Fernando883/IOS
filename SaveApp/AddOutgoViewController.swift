//
//  AddOutgoViewController.swift
//  SaveApp
//
//  Created by Aitor Pagán on 26/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class AddOutgoViewController: UIViewController, SSRadioButtonControllerDelegate {
    
    let outgoFacade = OutgoesFacade()

    var radioButtonController: SSRadioButtonsController?
    			
    @IBOutlet weak var variableRadioButton: UIButton!
    
    @IBOutlet weak var fijoRadioButton: UIButton!
    
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var conceptTextField: UITextField!
    
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        radioButtonController = SSRadioButtonsController(buttons: fijoRadioButton, variableRadioButton)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        let isPresentingAddOutgoMode = presentingViewController is UINavigationController
        
        if isPresentingAddOutgoMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
            
        }
        
        
    }
   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender === saveButton {
            let concept = conceptTextField.text ?? ""
            let numberFormatter = NSNumberFormatter()
            let number = numberFormatter.numberFromString(quantityTextField.text!)
            let quantity = number?.floatValue
            let dateOutgo = dateDatePicker.date
            let type = radioButtonController?.selectedButton()?.titleLabel?.text
            
            outgoFacade.saveOutgo(concept, quantity: quantity, dateOutgo: dateOutgo, type: type!)
        }
    }
    

}
