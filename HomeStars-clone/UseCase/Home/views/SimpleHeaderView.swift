//
//  SimpleHeaderView.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import UIKit

class SimpleHeaderView: UIView {
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var serviceTitle: UILabel!
    

    
    
    let nibName = "SimpleHeaderView"
        
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
            let bundle = Bundle(for: SimpleHeaderView.self)
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
    
    
    
}
