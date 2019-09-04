//
//  CustomTableViewCell.swift
//  AlamofireDemoApp
//
//  Created by Bhupinder on 5/9/19.
//  Copyright © 2019 Bhupinder. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var sNoLbl: UILabel!
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var detailsLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
