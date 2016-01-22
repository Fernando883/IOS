//
//  CollaboratorTableViewController.swift
//  SaveApp
//
//  Created by MacBooKPro on 22/1/16.
//  Copyright © 2016 MacBooKPro. All rights reserved.
//

import UIKit

class CollaboratorTableViewController: UITableViewController {
    
    // MARK: Properties
    
    var offers = [Offer]()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleOffer()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return offers.count
    }
    
    // Mark: otherFunction
    
    func loadSampleOffer(){
        
        let photo1 = UIImage(named: "Offer1")
        let offer1 = Offer(name: "Pan del mercadona", photo: photo1, descriptionOffer: "Oferta de pan", rating: 5, validDate: "20-3-89", price: "0.40")
        
        offers += [offer1]
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CollaboratorTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! CollaboratorTableViewCell
        let offer = offers[indexPath.row]
        
        cell.nameOffer.text = offer.name
        cell.photoOffer.image = offer.photo
        cell.descriptionOffer.text = offer.descriptionOffer
        cell.ratingControlOffer.rating = offer.rating
        cell.price.text = offer.price 
        cell.dateOffer.text = offer.validDate
        

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
