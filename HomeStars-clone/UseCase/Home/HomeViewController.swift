//
//  ViewController.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-17.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
    private let bag = DisposeBag()
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: HomeViewModel = HomeViewModel(homeService: MockHomeService())
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpView()
        bindTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUpNavBar("", true, false)
    }
    
    private func bindTableView() {
        viewModel.fetchServices()
        viewModel.fetchBlogs()
        viewModel.services.subscribe(onNext: { [unowned self] query in
            self.tableView.reloadData()
        })
        .disposed(by: bag)
        viewModel.blogs.subscribe(onNext: { [unowned self] query in
            self.tableView.reloadData()
        })
        .disposed(by: bag)
    }
    
    func setUpView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeHeaderTableViewCell")
        tableView.register(UINib(nibName: "ProjectsTableViewCell", bundle: nil), forCellReuseIdentifier: "ProjectsTableViewCell")
        tableView.register(UINib(nibName: "BlogsTableViewCell", bundle: nil), forCellReuseIdentifier: "BlogsTableViewCell")
        self.tableView.reloadData()
        
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 1,2,3:
            return 30
        
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            let view = SimpleHeaderView(frame: CGRect.zero)
            view.serviceTitle.text = "Urgent requests"
            return view
        case 2:
            let view = SimpleHeaderView(frame: CGRect.zero)
            view.serviceTitle.text = "Start your summer project"
            return view
        case 3:
            let view = SimpleHeaderView(frame: CGRect.zero)
            view.serviceTitle.text = "Latest from the blog"
            return view
        default:
            return nil
        }
   
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeHeaderTableViewCell", for: indexPath) as! HomeHeaderTableViewCell
            cell.searchView.btn.rx.tap.bind {
                let viewController = ServiceListViewController(viewModel: ServiceListViewModel(services: self.viewModel.services.value))
                self.navigationController?.pushViewController (viewController, animated: true)
                
            }.disposed(by: bag)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectsTableViewCell", for: indexPath) as! ProjectsTableViewCell
            cell.navigationController = self.navigationController
            cell.data = self.viewModel.urgentServices.value
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProjectsTableViewCell", for: indexPath) as! ProjectsTableViewCell
            cell.navigationController = self.navigationController
            cell.data = self.viewModel.summerServices.value
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlogsTableViewCell", for: indexPath) as! BlogsTableViewCell
            cell.data = self.viewModel.blogs.value
            return cell
        default:
            let cell = UITableViewCell()
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 260
        case 1:
            return 200
        case 2:
            return 200
        case 3:
            return 218
        default:
            return 0
        }
    }
    
}

