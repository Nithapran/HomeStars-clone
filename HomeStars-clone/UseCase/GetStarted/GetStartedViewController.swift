//
//  GetStartedViewController.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import UIKit

class GetStartedViewController: UIViewController {
    
    var service: Service?

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setUpNavBar()
    }
    
    func setUpView() {
        self.title = service?.name ?? ""
        let leftNavBarButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector (didClickCloseButton))
        leftNavBarButton.tintColor = UIColor(named: "TextColor")
        self.navigationItem.leftBarButtonItem = leftNavBarButton
    }
    
    @objc func didClickCloseButton() {
        self.dismiss(animated: true)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
