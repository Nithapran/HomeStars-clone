//
//  ServiceView.swift
//  SpiritsBar
//
//  Created by Nithaparan Francis on 2022-10-05.
//

import Foundation
import UIKit
import SDWebImage


@IBDesignable
final class ServiceView: UIView {
    
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var serviceImageView: UIImageView!
    
    @IBOutlet weak var serviceTitle: UILabel!
    
    
    var service: Service? {
        didSet {
            setUpView()
        }
    }
    
    
    let nibName = "ServiceView"
        
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
            let bundle = Bundle(for: ServiceView.self)
            let nib = UINib(nibName: nibName, bundle: bundle)
            return nib.instantiate(withOwner: self, options: nil).first as? UIView
        }
    
    func setUpView() {
        self.serviceImageView.image = UIImage(named: self.service?.image ?? "")
        self.serviceTitle.text = self.service?.name
    }
    
}
