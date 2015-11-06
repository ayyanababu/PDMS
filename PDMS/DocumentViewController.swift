//
//  DocumentViewController.swift
//  PDMS
//
//  Created by Raja Ayyan on 04/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

protocol DocumentViewProtocol{
    
    func notifyDocumentCreationIsDone()
}

class DocumentViewController: UIViewController {
    
    var delegate: DocumentViewProtocol?
    
    var newDocName: String?
    

    @IBAction func donebutton(sender: AnyObject) {
        
        dismissViewControllerAnimated(false, completion: nil)
        delegate?.notifyDocumentCreationIsDone()

        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(newDocName)")
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
