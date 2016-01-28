////
////  AddIncomeViewController.swift
////  SaveApp
////
////  Created by Aitor Pagán on 25/1/16.
////  Copyright © 2016 MacBooKPro. All rights reserved.
////
//
//import UIKit
//import CoreData
//
//class AddIncomeViewController: UIViewController {
//
//    //MARK: Properties
//    
//    let incomeFacade = IncomesFacade()
//    var income = Incomes?()
//    
//    @IBOutlet weak var saveButton: UIBarButtonItem!
//    @IBOutlet weak var conceptTextField: UITextField!
//    @IBOutlet weak var quantityTextField: UITextField!
//    @IBOutlet weak var dateDatePicker: UIDatePicker!
//    
//    @IBAction func cancel(sender: UIBarButtonItem) {
//        
//        let isPresentingAddIncomeMode = presentingViewController is UINavigationController
//        
//        if isPresentingAddIncomeMode {
//            dismissViewControllerAnimated(true, completion: nil)
//        } else {
//            navigationController!.popViewControllerAnimated(true)
//    
//        }
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        if sender === saveButton {
//            let concept = conceptTextField.text ?? ""
//            let numberFormatter = NSNumberFormatter()
//            let number = numberFormatter.numberFromString(quantityTextField.text!)
//            let quantity = number?.floatValue
//            let dateIncome = dateDatePicker.date
//            
//            incomeFacade.saveIncome(concept, quantity: quantity, dateIncome: dateIncome)
//        }
//        
//    }

//
//    
//
//}
