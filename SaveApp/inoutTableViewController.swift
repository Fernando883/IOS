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
    
    var incomes = [Income]()
    var outgoes = [Outgo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if outgo == true{
            navigationBar.rightBarButtonItems?.removeFirst()
            loadSampleOutgoes()
        }else if outgo == false{
            navigationBar.rightBarButtonItems?.popLast()
            loadSampleIncomes()
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
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "inoutCellView"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! inoutTableViewCell
        
        if outgo == true{
            
            let outgoe = outgoes[indexPath.row]
            
            cell.conceptTextLabel.text = outgoe.concept
            cell.quantityTextLabel.text = outgoe.quantity
            cell.dateTextLabel.text = outgoe.dateOutgo
            
            
        }else if outgo == false{//If we want to see incomes
            
            let income = incomes[indexPath.row]
            
            cell.conceptTextLabel.text = income.concept
            cell.quantityTextLabel.text = income.quantity
            cell.dateTextLabel.text = income.dateIncome
            
        }
        
        // Configure the cell...
        
        return cell
    }
    
    //Other funcs
    
    func loadSampleIncomes(){
        
        let income1 = Income(concept:"Nomina", quantity:"1200",dateIncome: "01 de Enero")
        let income2 = Income(concept: "Ingreso Efectivo",quantity: "150",dateIncome: "22 de Enero")
        
        incomes+=[income1,income2]
        
    }
    
    func loadSampleOutgoes(){
        
        let outgo1 = Outgo(concept: "Pan", quantity: "0,30", dateOutgo: "01/01")
        let outgo2 = Outgo(concept: "Play 4", quantity: "299", dateOutgo: "06/01")
        let outgo3 = Outgo(concept: "Mercadona", quantity: "65", dateOutgo: "15/01")
        
        outgoes += [outgo1,outgo2,outgo3]
        
    }
    
    

}
