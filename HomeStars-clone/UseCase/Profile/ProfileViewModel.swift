//
//  ProfileViewModel.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-20.
//

import Foundation
import RxSwift
import RxRelay

class ProfileViewModel {
    private let bag = DisposeBag()
    
    let userService: UserServiceProtocol
    
    var profile: BehaviorRelay<Profile?> = BehaviorRelay<Profile?>(value: Profile(name: "", location: "", memberSince: "", email: "", phoneNumber: "", postalCode: "", image: ""))
    
    init(userService: UserServiceProtocol) {
        self.userService = userService
    }
    
    func fetchProfile() {
        userService.getProfile().subscribe({ [weak self] response in
            guard self != nil else {
                return
            }
             switch response {
            case let .next(data):
                 
                 self?.profile.accept(data )
            case let .error(error):
               print(error)
            case .completed:
                break
            }
        }).disposed(by: bag)
    }
}
