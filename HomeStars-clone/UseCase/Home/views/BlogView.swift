//
//  BlogView.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import Foundation
import UIKit
import SDWebImage


@IBDesignable
final class BlogView: UIView {
    

    @IBOutlet weak var blogImageView: UIImageView!
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var blog: Blog? {
        didSet {
            setUpView()
        }
    }
    
    
    let nibName = "BlogView"
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            commonInit()
        }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            commonInit()
        }
    
        override func prepareForInterfaceBuilder() {
            super.prepareForInterfaceBuilder()
            commonInit()
        }
        
        func commonInit() {
            guard let view = loadViewFromNib() else { return }
            view.frame = self.bounds
            self.addSubview(view)
        }
    
    override func draw(_ rect: CGRect) {
        
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
        
        func loadViewFromNib() -> UIView? {
            let bundle = Bundle(for: BlogView.self)
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
    
    func setUpView() {
        self.blogImageView.sd_setImage(with: URL(string: self.blog?.image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
        self.titleLabel.text = self.blog?.title ?? ""
        self.contentLabel.text = self.blog?.content ?? ""
    }
    
}
