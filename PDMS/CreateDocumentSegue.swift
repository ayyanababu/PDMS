//
//  CreateDocumentSegue.swift
//  PDMS
//
//  Created by Raja Ayyan on 04/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class CreateDocumentSegue: UIStoryboardSegue {
    
    override func perform() {
        let sourceViewController = self.sourceViewController
        let destinationViewController = self.destinationViewController
        
        sourceViewController.view.addSubview(destinationViewController.view)
        
        destinationViewController.view.transform = CGAffineTransformMakeScale(0.05, 0.05)
        
        

        
        
        
        UIView.animateWithDuration(1.0, delay: 0.5, options: UIViewAnimationOptions.CurveEaseInOut
            , animations: { () -> Void in
                destinationViewController.view.transform = CGAffineTransformMakeScale(1.0, 1.0)
                
            }) { (finished) -> Void in
                destinationViewController.view.removeFromSuperview()
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.01 * Double(NSEC_PER_SEC)))
                dispatch_after(time, dispatch_get_main_queue()
                    , { () -> Void in
                        sourceViewController.presentViewController(destinationViewController
                            , animated: false
                            , completion: nil)
                })
        }
    }

}
