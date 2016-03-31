//
//  artistCell.swift
//  LiveMate
//
//  Created by Tim Kaing on 3/30/16.
//  Copyright © 2016 Zeus. All rights reserved.
//

import UIKit

class artistCell: UITableViewCell {

    @IBOutlet weak var artistNameTextField: UITextField!
    
    @IBOutlet weak var artistImageView: UIImageView!
    
    
    override func awakeFromNib() {
        
        
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
