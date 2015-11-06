//
//  NamePopoverViewController.swift
//  PDMS
//
//  Created by Raja Ayyan on 05/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class NamePopoverViewController: UIViewController, UITextFieldDelegate, DocumentViewProtocol {
    
    
    @IBOutlet weak var newDocumentNameLabel: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.doneButton.userInteractionEnabled = false
        self.newDocumentNameLabel.delegate = self
    }


    
    @IBAction func clickOnCreateName(sender: UIButton) {
        
        //createform
        performSegueWithIdentifier("createform", sender: sender)

        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "createform"
        {
            let navcontroller = segue.destinationViewController as? UINavigationController
            if let controller = navcontroller?.topViewController as? DocumentViewController{
                controller.delegate = self
                
            }
            
            if let controller = segue.destinationViewController as? DocumentViewController{
                controller.delegate = self
            }
            
            
        }
    }
    
    func notifyDocumentCreationIsDone()
    {
        dismissViewControllerAnimated(false, completion: nil)
    }
    
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        
        let length = textField.text?.characters.count
        if length >= 0
        {
            self.doneButton.userInteractionEnabled = true
            
        }
       return true
    }

    
}
