//
//  ProjectsTableViewCell.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-18.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {
    
    var data: [Service] = [] {
        didSet {
            self.horizontalScrollView.reloadData()
        }
    }

    @IBOutlet weak var horizontalScrollView: HorizontalScrollView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        horizontalScrollView.delegate = self
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ProjectsTableViewCell: HorizontalScrollViewDelagate {
    func spaceBetweenItems(horizontalScrollView: HorizontalScrollView) -> Double {
        return 5
    }
    
    func numberOfItems(horizontalScrollView: HorizontalScrollView) -> Int {
        return data.count
    }
    
    func viewForTheItemAt(horizontalScrollView: HorizontalScrollView, index: Int) -> UIView {
        let view = ServiceView(frame: CGRect.zero)
        view.service = self.data[index]
        return view
    }
    
    func didSelectAt(horizontalScrollView: HorizontalScrollView) {
        
    }
    
    func heightForTheView(horizontalScrollView: HorizontalScrollView) -> Double {
        40
    }
    
    
}
