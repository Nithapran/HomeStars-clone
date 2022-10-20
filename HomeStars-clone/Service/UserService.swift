//
//  UserService.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-29.
//

import Foundation
import RxSwift

enum UserServiceError: Error {
    case UserNameNotFound
}

protocol UserServiceProtocol{
    func getProfile() -> Observable<Profile?>
    
}
