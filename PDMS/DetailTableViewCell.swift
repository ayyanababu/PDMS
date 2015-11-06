//
//  DetailTableViewCell.swift
//  PDMS
//
//  Created by Raja Ayyan on 03/11/15.
//  Copyright © 2015 metricstream. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var docName: UILabel!
    @IBOutlet weak var version: UILabel!
    @IBOutlet weak var effectivedate: UILabel!
    @IBOutlet weak var downloadButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    
    override func layoutSubviews() {
        
        
        
        
        //        self.userImage.backgroundColor = UIColor.clearColor()
        //        self.docName.backgroundColor = UIColor.clearColor()
        //        self.version.backgroundColor = UIColor.clearColor()
        //        self.effectivedate.backgroundColor = UIColor.clearColor()
        //        self.infoButton.backgroundColor = UIColor.clearColor()
        //        self.downloadButton.backgroundColor = UIColor.clearColor()
        
        self.userImage.layer.cornerRadius = self.userImage.bounds.size.width / 2
        self.userImage.clipsToBounds = true
        
        self.userImage.layer.borderWidth = 3.0
        self.userImage.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        
        
    }
    
    
    @IBAction func downloadAction(sender: UIButton) {
    }
    
    
    
    @IBAction func infoAction(sender: UIButton) {
    }
    
    
}
