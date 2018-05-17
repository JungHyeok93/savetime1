//
//  CustomTableViewCell.swift
//  savetime
//
//  Created by 정혁 on 2018. 5. 16..
//  Copyright © 2018년 정혁. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var siteimage: UIImageView!
    
    @IBOutlet weak var sitelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
