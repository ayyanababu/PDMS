//
//  MasterController.swift
//  PDMS
//
//  Created by Raja Ayyan on 03/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class MasterController: UITableViewController {
    
    
    lazy var productLines: [ProductLine] = {
        return ProductLine.productLines()
        }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Categories"
        tableView.tableFooterView = UIView(frame:CGRectZero)
        self.tableView.backgroundColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0)
        self.tableView.separatorStyle = .None
        
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return productLines.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        let productLine = productLines[section]
        return productLine.products.count
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showdetail", sender: nil)

    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("mastercell", forIndexPath: indexPath)
        let productLine = productLines[indexPath.section]
        let product = productLine.products[indexPath.row]
        
        cell.textLabel?.text = product.title
        cell.backgroundColor = UIColor.clearColor()
        cell.textLabel?.backgroundColor = UIColor.clearColor()
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showdetail"{
            
            if let indexPath = self.tableView.indexPathForSelectedRow{
                //let value = array[indexPath.row]
                let detailView = (segue.destinationViewController as! UINavigationController).topViewController as! DetailController
                detailView.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                detailView.navigationItem.leftItemsSupplementBackButton = true
            }
            
        }
    }
    
    
    //MARK: - SectionHeader
    
    // MARK: - Table view data source
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let productLine = productLines[section]
        return productLine.name
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = UIColor.lightGrayColor()
    }
    
   
}
