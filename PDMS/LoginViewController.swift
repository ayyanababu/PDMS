//
//  LoginViewController.swift
//  PDMS
//
//  Created by Raja Ayyan on 03/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit


protocol LoginViewControllerDelegate {
    func didLoginSuccessfully()
}

class LoginViewController: UIViewController, UITextFieldDelegate{
    
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var delegate: LoginViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        backgroundImageView.layer.cornerRadius = 10.0
        backgroundImageView.clipsToBounds = true
        blurView.layer.cornerRadius = 10.0
        blurView.clipsToBounds = true
        
        
        let usernamePlaceholder = NSAttributedString(string: "UserName", attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
        
        let passwordPlaceholder = NSAttributedString(string: "Password", attributes: [NSForegroundColorAttributeName : UIColor.lightGrayColor()])
        
        usernameField.attributedPlaceholder = usernamePlaceholder
        passwordField.attributedPlaceholder = passwordPlaceholder
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func loginAction(sender: UIButton) {
        if usernameField.text == "metricstream" && passwordField.text == "12345678" {
            resignFirstResponder()
            delegate?.didLoginSuccessfully()
        }else {
            let alertController = UIAlertController(title: "Error!", message: "The username and password combination failed.", preferredStyle: .Alert)
            let ok = UIAlertAction(title: "OK", style: .Default, handler: { (action) -> Void in
            })
            alertController.addAction(ok)
            presentViewController(alertController, animated: true, completion: nil)
        }
        
    }
    
    
    //MARK: - TextFieldDelegates
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        return true
    }
    
}
