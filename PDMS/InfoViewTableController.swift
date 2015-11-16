//
//  InfoViewTableController.swift
//  PDMS
//
//  Created by Raja Ayyan on 04/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit


class InfoViewTableController: UITableViewController {
    
    
    
    
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var docAttachmentURL: UILabel!
    @IBOutlet weak var docVersion: UILabel!
    @IBOutlet weak var docStatus: UILabel!
    @IBOutlet weak var docNumber: UILabel!
    @IBOutlet weak var docAuthor: UILabel!
    @IBOutlet weak var docOwner: UILabel!
    @IBOutlet weak var docEffectiveDate: UILabel!
    @IBOutlet weak var docLifeCycle: UILabel!
    @IBOutlet weak var docAssociatedCategory: UILabel!
    @IBOutlet weak var footerView: UIView!
    
    

    
    @IBAction func doneViewing(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.footerView.layer.cornerRadius = 5.0
        self.footerView.clipsToBounds = true

    }

  

}
