//
//  HomeViewModel.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import Foundation
import RxSwift
import RxRelay

class HomeViewModel {
    private let bag = DisposeBag()
    
    let homeService: HomeServiceProtocol
    
    var services: BehaviorRelay<[Service]> = BehaviorRelay<[Service]>(value: [])
    
    var blogs: BehaviorRelay<[Blog]> = BehaviorRelay<[Blog]>(value: [])
    
    var summerServices: BehaviorRelay<[Service]> = BehaviorRelay<[Service]>(value: [])
    
    var urgentServices: BehaviorRelay<[Service]> = BehaviorRelay<[Service]>(value: [])
    
    init(homeService: HomeServiceProtocol) {
        self.homeService = homeService
    }
    
    func fetchServices() {
        homeService.getServices().subscribe({ [weak self] response in
            guard self != nil else {
                return
            }
             switch response {
            case let .next(data):
                 print(data as Any)
                 self?.services.accept(data ?? [])
                 self?.filterServices()
            case let .error(error):
               print(error)
            case .completed:
                break
            }
        }).disposed(by: bag)
    }
    
    func fetchBlogs() {
        homeService.getBlogs().subscribe({ [weak self] response in
            guard self != nil else {
                return
            }
             switch response {
            case let .next(data):
                 print(data as Any)
                 self?.blogs.accept(data ?? [])
            case let .error(error):
               print(error)
            case .completed:
                break
            }
        }).disposed(by: bag)
    }
    
    func filterServices() {
        summerServices.accept(services.value.filter {
            $0.tag.contains("summer")
        })
        urgentServices.accept(services.value.filter {
            $0.tag.contains("urgent")
        })
    }
}
