//
//  ProfileDetailsTableViewCell.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-20.
//

import UIKit

class ProfileDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var detailValueLabel: UILabel!
    @IBOutlet weak var detailCategoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
