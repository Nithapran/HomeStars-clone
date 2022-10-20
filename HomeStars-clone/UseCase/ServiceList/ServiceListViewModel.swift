//
//  ServiceListViewModel.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import Foundation
import RxSwift
import RxRelay

class ServiceListViewModel {
    let services: [Service]
    var searchText: String = "" {
        didSet {
            if searchText != "" {
                servicesFiltered.accept(
                    services.filter {
                        $0.name.lowercased().contains(searchText.lowercased())
                    })
            } else {
                servicesFiltered.accept(
                    services)
            }
        }
    }
    var servicesFiltered: BehaviorRelay<[Service]> = BehaviorRelay<[Service]>(value: [])
    
    init(services: [Service] = []) {
        self.services = services
        self.servicesFiltered.accept(services)
    }
}
