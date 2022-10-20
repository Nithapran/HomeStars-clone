//
//  HorizontalScrollView.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-06.
//

import Foundation
import UIKit

protocol HorizontalScrollViewDelagate: AnyObject {
    func numberOfItems(horizontalScrollView: HorizontalScrollView) -> Int
    func spaceBetweenItems(horizontalScrollView: HorizontalScrollView) -> Double
    func viewForTheItemAt(horizontalScrollView: HorizontalScrollView, index: Int) -> UIView
    func didSelectAt(horizontalScrollView: HorizontalScrollView)
    func heightForTheView(horizontalScrollView: HorizontalScrollView) -> Double
}

class HorizontalScrollView: UIView {
    
    weak var delegate: HorizontalScrollViewDelagate?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.backgroundColor = .clear
        scrollView.isUserInteractionEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.backgroundColor = .clear
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    func setUpView() {
        self.backgroundColor = .clear
        self.addSubview(scrollView)
        self.scrollView.addSubview(stackView)
        
        setUpConstraints()
        reloadData()
    }
    
    func setUpConstraints() {
        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.contentLayoutGuide.widthAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        
        
    }
    
    
    func reloadData() {
        let itemCount = delegate?.numberOfItems(horizontalScrollView: self) ?? 0
        let space = delegate?.spaceBetweenItems(horizontalScrollView: self) ?? 0
        self.stackView.spacing = space
        var x = 0
        while (x < itemCount) {
            let view = delegate?.viewForTheItemAt(horizontalScrollView: self, index: x) ?? UIView()
            view.tag = x
            stackView.addArrangedSubview(view)
            x = x + 1
        }
        
    }
    
}
