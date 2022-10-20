//
//  ProfileViewController.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-20.
//

import UIKit
import RxSwift

class ProfileViewController: UIViewController {
    private let bag = DisposeBag()
    
    var viewModel = ProfileViewModel(userService: MockUserService())

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        setUpView()
        bindTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUpNavBar("", true, false)
    }
    
    private func bindTableView() {
        viewModel.fetchProfile()
       
        viewModel.profile.subscribe(onNext: { [unowned self] query in
            self.tableView.reloadData()
        })
        .disposed(by: bag)
        
    }

    func setUpView() {
        tableView.register(UINib(nibName: "ProfileHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileHeaderTableViewCell")
        tableView.register(UINib(nibName: "ProfileDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileDetailsTableViewCell")
        tableView.register(UINib(nibName: "ProfileSettingsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileSettingsTableViewCell")
        view.backgroundColor = UIColor(named: "BackgroundColor")
    }

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileHeaderTableViewCell", for: indexPath) as! ProfileHeaderTableViewCell
            cell.locationLabel.text = self.viewModel.profile.value?.location
            cell.nameLabel.text = self.viewModel.profile.value?.name
            cell.memberSinceLabel.text = self.viewModel.profile.value?.getMemberSinceString()
            cell.profileImageView.sd_setImage(with: URL(string: self.viewModel.profile.value?.image ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            cell.profileImageView.layer.borderWidth = 0.5
            cell.profileImageView.layer.borderColor = UIColor.gray.cgColor
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileDetailsTableViewCell", for: indexPath) as! ProfileDetailsTableViewCell
            cell.detailCategoryLabel.text = "Name"
            cell.detailValueLabel.text = self.viewModel.profile.value?.name
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileDetailsTableViewCell", for: indexPath) as! ProfileDetailsTableViewCell
            cell.detailCategoryLabel.text = "Email Address"
            cell.detailValueLabel.text = self.viewModel.profile.value?.email
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileDetailsTableViewCell", for: indexPath) as! ProfileDetailsTableViewCell
            cell.detailCategoryLabel.text = "Phone Number"
            cell.detailValueLabel.text = self.viewModel.profile.value?.phoneNumber
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileDetailsTableViewCell", for: indexPath) as! ProfileDetailsTableViewCell
            cell.detailCategoryLabel.text = "Postal Code"
            cell.detailValueLabel.text = self.viewModel.profile.value?.postalCode
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileSettingsTableViewCell", for: indexPath) as! ProfileSettingsTableViewCell
            cell.type = .account
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileSettingsTableViewCell", for: indexPath) as! ProfileSettingsTableViewCell
            cell.type = .contact
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileSettingsTableViewCell", for: indexPath) as! ProfileSettingsTableViewCell
            cell.type = .logout
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            
            return 267
        case 1,2,3,4:
            
            return 70
        case 5,6,7:
            return 70
        default:
            return 0
        }
    }
    
    
}
