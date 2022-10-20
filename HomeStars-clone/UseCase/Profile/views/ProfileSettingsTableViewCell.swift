//
//  ProfileSettingsTableViewCell.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-20.
//

import UIKit

enum ProfileSettingCategory{
    case account
    case contact
    case logout
    
    var image: UIImage?  {
        switch self {
        case .account:
            return UIImage(systemName: "gearshape")
        case .contact:
            return UIImage(systemName: "envelope")
        case .logout:
            return UIImage(systemName: "rectangle.portrait.and.arrow.right")
        }
    }
    
    var title: String  {
        switch self {
        case .account:
            return "Account Settings"
        case .contact:
            return "Contact Support"
        case .logout:
            return "Log Out"
        }
    }
}

class ProfileSettingsTableViewCell: UITableViewCell {
    var type: ProfileSettingCategory = .account {
        didSet {
            setUpView()
        }
    }
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    @IBOutlet weak var rightArrowImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUpView() {
        self.categoryImageView.image = self.type.image
        self.categoryLabel.text = self.type.title
    }
    
}
