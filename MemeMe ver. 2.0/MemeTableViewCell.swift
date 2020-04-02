//
//  MemeTableViewCell.swift
//  MemeMe ver. 2.0
//
//  Created by Vassileios Vassileiades on 2/4/20.
//  Copyright © 2020 Vassileios Vassileiades. All rights reserved.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var memeImageView: UIImageView!
    
 override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
