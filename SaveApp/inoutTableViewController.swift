//
//  incomesViewController.swift
//  SaveApp
//
//  Created by noussair el harrak on 23/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit
import CoreData

class inoutTableViewController: UITableViewController {
    
    let incomeFacade = IncomesFacade()
    let outgoesFacade = OutgoesFacade()

    var outgo: Bool?
    
    @IBOutlet weak var edit: UIBarButtonItem!
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var addIncomeButton: UIBarButtonItem!
    @IBOutlet weak var addOutgoButton: UIBarButtonItem!
    
    @IBOutlet weak var add: UIBarButtonItem!
    
    var incomes = [Incomes]()
    var outgoes = [Outgoes]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //edit = editButtonItem()

        // Do any additional setup after loading the view.
        if outgo == true{
            navigationBar.rightBarButtonItems?.removeFirst()

        }else if outgo == false{
            navigationBar.rightBarButtonItems?.popLast()

        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if outgo == true{
            outgoes = outgoesFacade.getOutgoes()
        }else if outgo == false{
            incomes = incomeFacade.getIncomes()
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowItem" {
            let addOutgoViewController = segue.destinationViewController as! AddOutgoViewController
            addOutgoViewController.showItem = true
            if outgo == true{
                // Get the cell that generated this segue.
                if let selectedOutgoCell = sender as? inoutTableViewCell {
                    let indexPath = tableView.indexPathForCell(selectedOutgoCell)!
                    let selectedOutgoes = outgoes[indexPath.row]
                    addOutgoViewController.outgo = selectedOutgoes
                    
                }
            }else {
                if let selectedIncomeCell = sender as? inoutTableViewCell {
                    let indexPath = tableView.indexPathForCell(selectedIncomeCell)!
                    let selectedIncomes = incomes[indexPath.row]
                    addOutgoViewController.income = selectedIncomes
                    
                }
        }
       
        }else if segue.identifier == "AddOutgo" {
            
            let destiny = segue.destinationViewController as! UINavigationController
            
            destiny.title = "Add Outgo"
            
        }else if segue.identifier == "AddIncome" {
            let destiny = segue.destinationViewController as! UINavigationController
            
            destiny.title = "Add Income"
        }
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(outgo == true){
            if editingStyle == .Delete {
                // Delete the row from the data source
                
                outgoesFacade.deleteOutgoes(indexPath.row)
                outgoes.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
                
            }
        }
        else{
            if editingStyle == .Delete {
                // Delete the row from the data source
                incomeFacade.deleteIncomes(indexPath.row)
                incomes.removeAtIndex(indexPath.row)
                tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            }

        }
     
    }

    
    
    //MARK: Cell Configuration
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if outgo == true {
            return outgoes.count
        }else{
           return incomes.count
        }
    }
    
//    @IBAction func unwindToAddIncomeList(sender: UIStoryboardSegue) {
//        
//        incomes = incomeFacade.getIncomes()
//        
//        tableView.reloadData()
//        
//        
//    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "inoutCellView"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! inoutTableViewCell
        
        if outgo == true{
            
            let outgo = outgoes[indexPath.row]
            
            if outgo.type == "Fijo"{
                
                cell.backgroundColor = UIColor(red: 0.88, green: 0.0, blue: 0.2, alpha: 0.6)
            }else if outgo.type == "Variable"{
                cell.backgroundColor = UIColor(red: 0.0, green: 0.8, blue: 0.2, alpha: 0.6)
            }
            
            cell.conceptTextLabel.text = outgo.concept
            cell.quantityTextLabel.text = outgo.quantity?.stringValue
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            if outgo.dateOutgo != nil{
                cell.dateTextLabel.text = dateFormatter.stringFromDate(outgo.dateOutgo!)
            }else{
                cell.dateTextLabel.text = ""
            }
            
            
            
        }else if outgo == false{//If we want to see incomes
            
            let income = incomes[indexPath.row]
            
            cell.conceptTextLabel.text = income.concept
            cell.quantityTextLabel.text = income.quantity?.stringValue
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy/MM/dd"
            if income.dateIncome != nil{
                cell.dateTextLabel.text = dateFormatter.stringFromDate(income.dateIncome!)
            }else{
                cell.dateTextLabel.text = ""
            }
            
        }
        
        // Configure the cell...
        
        return cell
    }
    
    @IBAction func unwindToAddOutgoList(sender: UIStoryboardSegue){
        
        if outgo == true{
            if let sourceViewController = sender.sourceViewController as? AddOutgoViewController, outgo = sourceViewController.outgo {
                if let selectedIndexPath = tableView.indexPathForSelectedRow  {
                    
                    outgoesFacade.saveOutgo(outgo, index: selectedIndexPath)
                    tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                }
                
            }
            
            outgoes = outgoesFacade.getOutgoes()
            
            tableView.reloadData()
        }else if outgo == false{
            if let sourceViewController = sender.sourceViewController as? AddOutgoViewController, income = sourceViewController.income {
                if let selectedIndexPath = tableView.indexPathForSelectedRow  {
                    
                    incomeFacade.saveIncome(income, index: selectedIndexPath)
                    tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
                }
                
            }
            
            incomes = incomeFacade.getIncomes()
            
            tableView.reloadData()
        }
        
        tableView.reloadData()

    }

}
