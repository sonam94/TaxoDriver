//
//  HeaderTableViewCell.swift
//  SideMenuBar
//
//  Created by Rakesh Kumar on 20/03/19.
//  Copyright © 2019 Rakesh Kumar. All rights reserved.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
class FirstTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbl_items: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
