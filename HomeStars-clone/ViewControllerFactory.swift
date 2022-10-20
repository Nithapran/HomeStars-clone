//
//  ViewControllerFactory.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//
import Foundation
import UIKit

enum TypeOfViewController {
    case mainTabBar
    case home
    case serviceList
    
    var id: String {
        switch self {
        case .mainTabBar:
            return "MainTabBarController"
        case .home:
            return "HomeViewController"
        case .serviceList:
            return "ServiceListViewController"
        }
    }
}

class ViewControllerFactory: NSObject {
    static func viewController(for typeOfVC: TypeOfViewController) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: typeOfVC.id)
        return vc
    }
}
