//
//  UIViewController+Extension.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import Foundation
import UIKit

extension UIViewController {
    func setUpNavBar(_ title: String = "",_ isHidden: Bool = false,_ prefersLargeTitles: Bool = true) {
        //navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.navigationBar.prefersLargeTitles = prefersLargeTitles
        if !prefersLargeTitles {
            navigationItem.largeTitleDisplayMode = .never
        }
        self.navigationController?.navigationBar.isHidden = isHidden
        self.navigationController?.navigationBar.topItem?.title = title
        
        
        
    }
}
