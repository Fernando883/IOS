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
    let incomeFacade = IncomesFacade()

    var radioButtonController: SSRadioButtonsController?
    			
    @IBOutlet weak var variableRadioButton: UIButton!
    
    @IBOutlet weak var fijoRadioButton: UIButton!
    
    var showItem: Bool?
    
    var addOutgo: Bool?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var conceptTextField: UITextField!
    
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    var income: Incomes?
    var outgo: Outgoes?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radioButtonController = SSRadioButtonsController(buttons: fijoRadioButton, variableRadioButton)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true

        
        
        
        if let outgoes = outgo{
            conceptTextField.text = outgoes.concept
            quantityTextField.text = outgoes.quantity?.stringValue
            dateDatePicker.setDate(outgoes.dateOutgo!, animated: true)
            if outgoes.type == "Fijo"{
                fijoRadioButton.selected = true
                radioButtonController?.selectedButton()?.titleLabel!.text = "Fijo"
            }else{
                variableRadioButton.selected = true
                radioButtonController?.selectedButton()?.titleLabel!.text = "Variable"
            }

        }else if let incomes = income{
            variableRadioButton.hidden = true
            fijoRadioButton.hidden = true
            
            conceptTextField.text = incomes.concept
            quantityTextField.text = incomes.quantity?.stringValue
            dateDatePicker.setDate(incomes.dateIncome!, animated: true)
            
        }else{
            if  navigationController!.title == "Add Income"{
                print("holaaaaaa soy income")
                navigationController!.title = "Add Income"
                variableRadioButton.hidden = true
                fijoRadioButton.hidden = true
            }else if navigationController!.title == "Add Outgo"{
                print("holaaaaaa")
                navigationController!.title = "Add Outgo"
            }
            
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        if showItem == true {
            navigationController!.popViewControllerAnimated(true)
        }
        else {
            dismissViewControllerAnimated(true, completion: nil)
        }
        
        
    }
   

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender === saveButton {
            if (navigationController!.title == "Add Outgo" || outgo != nil ){
                let outgoes = outgo
                let concept = conceptTextField.text ?? ""
                let numberFormatter = NSNumberFormatter()
                let number = numberFormatter.numberFromString(quantityTextField.text!)
                let quantity = number?.floatValue
                let dateOutgo = dateDatePicker.date
                let type = radioButtonController?.selectedButton()?.titleLabel?.text
                if showItem == true{
                    outgoes!.concept = concept
                    outgoes!.quantity = quantity
                    outgoes!.dateOutgo = dateOutgo
                    outgoes!.type = type
                }else{
                    outgoFacade.insertOutgo(concept, quantity: quantity, dateOutgo: dateOutgo, type: type!)
                }
                
            }
            else if (navigationController?.title == "Add Income" || income != nil){
                let incomes = income
                let concept = conceptTextField.text ?? ""
                let numberFormatter = NSNumberFormatter()
                let number = numberFormatter.numberFromString(quantityTextField.text!)
                let quantity = number?.floatValue
                let dateIncome = dateDatePicker.date
                if showItem == true{
                    incomes!.concept = concept
                    incomes!.quantity = quantity
                    incomes!.dateIncome = dateIncome
                }else{
                    incomeFacade.insertIncome(concept, quantity: quantity, dateIncome: dateIncome)
                }
            }
        }
    }
    

}
