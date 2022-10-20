//
//  BlogsTableViewCell.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import UIKit

class BlogsTableViewCell: UITableViewCell {

    @IBOutlet weak var horizontalScrollView: HorizontalScrollView!
    
    var data: [Blog] = [] {
        didSet {
            self.horizontalScrollView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        horizontalScrollView.delegate = self
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BlogsTableViewCell: HorizontalScrollViewDelagate {
    func spaceBetweenItems(horizontalScrollView: HorizontalScrollView) -> Double {
        return 5
    }
    
    func numberOfItems(horizontalScrollView: HorizontalScrollView) -> Int {
        return data.count
    }
    
    func viewForTheItemAt(horizontalScrollView: HorizontalScrollView, index: Int) -> UIView {
        let view = BlogView(frame: CGRect.zero)
        view.blog = self.data[index]
        return view
    }
    
    func didSelectAt(horizontalScrollView: HorizontalScrollView) {
        
    }
    
    func heightForTheView(horizontalScrollView: HorizontalScrollView) -> Double {
        40
    }
    
    
}
