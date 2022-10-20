//
//  SearchView.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//


import Foundation
import UIKit


@IBDesignable
final class SearchView: UIView {
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var container: UIView!
    
    @IBInspectable var cornerRadius: Double = 0.0 {
        didSet {
            self.container.layer.cornerRadius = cornerRadius
        }
    }
    
    
    
    let nibName = "SearchView"
        
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
            let bundle = Bundle(for: SearchView.self)
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
    
}
