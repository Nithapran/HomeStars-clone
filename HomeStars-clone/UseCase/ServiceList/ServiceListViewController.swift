//
//  ServiceListViewController.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import UIKit
import RxSwift
import RxCocoa

class ServiceListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ServiceListViewModel
    
    private let bag = DisposeBag()
    
    init(viewModel: ServiceListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "ServiceListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView
            .rx.setDelegate(self)
            .disposed(by: bag)
        setUpView()
        bindTableView()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.setUpNavBar("", false, false)
    }
    
    func setUpView() {
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
        textField.placeholder = "What service do you need?"
        view.addSubview(textField)
        self.navigationItem.titleView = view
        
        textField.rx.text.subscribe( onNext: {
            self.viewModel.searchText = $0 ?? ""
        }).disposed(by: bag)
        
    }
    
    private func bindTableView() {
        
        viewModel.servicesFiltered.subscribe(onNext: { [unowned self] query in
            self.tableView.reloadData()
        })
        .disposed(by: bag)
        tableView.register(UINib(nibName: "ServiceTableViewCell", bundle: nil), forCellReuseIdentifier: "ServiceTableViewCell")
        viewModel.servicesFiltered.bind(to: tableView.rx.items(cellIdentifier: "ServiceTableViewCell", cellType: ServiceTableViewCell.self)) { (row,news,cell) in
            
            cell.backgroundColor = UIColor(named: "BackgroundColor")
            cell.btn.rx.tap.bind {
                print(self.viewModel.servicesFiltered.value[row])
                let viewController = GetStartedViewController()
                viewController.service = self.viewModel.servicesFiltered.value[row]
                let nav = UINavigationController(rootViewController: viewController)
                nav.modalPresentationStyle = .fullScreen
                self.navigationController?.present(nav, animated: true) 
                
            }.disposed(by: self.bag)
            cell.serviceNameLabel.text = self.viewModel.servicesFiltered.value[row].name
            
            }.disposed(by: bag)
            
            tableView.rx.modelSelected(Service.self).subscribe(onNext: { item in
                print("SelectedItem: \(String(describing: item.name))")
            }).disposed(by: bag)
            
           
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

extension ServiceListViewController: UITableViewDelegate {
   
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.viewModel.servicesFiltered.value.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = UITableViewCell()
//        cell.backgroundColor = UIColor(named: "BackgroundColor")
//        let view = SimpleHeaderView(frame: cell.frame)
//        view.serviceTitle.text = self.viewModel.servicesFiltered.value[indexPath.row].name
//        cell.addSubview(view)
//        return cell
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 64
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.viewModel.servicesFiltered.value[indexPath.row])
    }
}
