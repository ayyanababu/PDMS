//
//  DetailController.swift
//  PDMS
//
//  Created by Raja Ayyan on 03/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class DetailController: UITableViewController, DocumentViewProtocol, UIPopoverPresentationControllerDelegate{
    
    
    struct storyBoardSegues{
        
        static let INFORMATION_VIEW_CONTROLLER_SEGUE: String = "infosegue"
        static let DETAIL_CELL_IDENTIFIER: String = "detailcell"
        static let CREATE_OR_ASSIGN_DOC_SEGUE: String = "createdoc"
        static let SHOW_ADD_DOC_POPOVER = "namepopover"
    }
    
    
    struct docDetail {
        let ownerImage: String
        let ownername: String
        let doctitle: String
        let version: String
        let effectivedate: String
        let currentownerimage: String
        
    }
    
    
    let detailDict: [docDetail] = [
        
        docDetail(ownerImage: "p4.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r5.png"),
        
        docDetail(ownerImage: "p2.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.1", effectivedate: "10/07/2015 12:38", currentownerimage: "r2.png"),
        
        docDetail(ownerImage: "p3.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r3.png"),
        
        docDetail(ownerImage: "p4.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r4.png"),
        
        docDetail(ownerImage: "p5.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r5.png"),
        
        docDetail(ownerImage: "p6.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r6.png"),
        
        docDetail(ownerImage: "p7.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r5.png"),
        
        docDetail(ownerImage: "p8.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r2.png"),
        
        docDetail(ownerImage: "p9.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r3.png"),
        
        docDetail(ownerImage: "p10.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r4.png"),
        
        docDetail(ownerImage: "p1.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r5.png"),
        
        docDetail(ownerImage: "p2.png", ownername: "Martin", doctitle: "Finance Document", version: "1.0.0", effectivedate: "10/07/2015 12:38", currentownerimage: "r6.png"),
        
    ]
    
    
    var seperatorVeiw: UIView?
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    //MARK: - UITableViewDataSourceMethods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailDict.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(storyBoardSegues.DETAIL_CELL_IDENTIFIER, forIndexPath: indexPath) as? DetailTableViewCell
        cell!.backgroundColor = UIColor(red: 55/255, green: 55/255, blue: 55/255, alpha: 1.0)
        
        //        seperatorVeiw?.frame = CGRectMake(6, 25, 100, 50)
        //        seperatorVeiw?.backgroundColor = UIColor.redColor()
        //        cell?.contentView.insertSubview(seperatorVeiw!, aboveSubview: (cell?.contentView)!)
        let eachcellitem = detailDict[indexPath.row]
        cell?.userImage.image = UIImage(named: eachcellitem.ownerImage)
        cell?.docName.text = eachcellitem.doctitle
        cell?.version.text = eachcellitem.version
        cell?.effectivedate.text = eachcellitem.effectivedate
        
        
        return cell!
    }
    
    
    
    
    @IBAction func infoAction(sender: UIButton) {
        
       // performSegueWithIdentifier(storyBoardSegues.INFORMATION_VIEW_CONTROLLER_SEGUE, sender: sender)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == storyBoardSegues.INFORMATION_VIEW_CONTROLLER_SEGUE{
            if let superviewcell = sender?.superview!!.superview! as? DetailTableViewCell{
                let indexpath = self.tableView.indexPathForCell(superviewcell)
                print(indexpath?.row)
            }
        }else if segue.identifier == storyBoardSegues.CREATE_OR_ASSIGN_DOC_SEGUE{
            
        }else if segue.identifier == storyBoardSegues.SHOW_ADD_DOC_POPOVER{
            
            if let controller = segue.destinationViewController as? NamePopoverViewController
            {
                controller.popoverPresentationController!.delegate = self
                controller.preferredContentSize = CGSize(width: 600, height: 100)
                
            }
        }
        
        
    }
    
    
    @IBAction func createDocument(sender: UIBarButtonItem) {
        
        performSegueWithIdentifier(storyBoardSegues.SHOW_ADD_DOC_POPOVER, sender: sender)
    }
    
    
    
    //MARK: DocumentViewProtocol
    
    func notifyDocumentCreationIsDone(){
        
    }
    
    //MARK: InfoViewProtocol
    
    func notifyInfoDocumentIsDone(){
        
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
}
