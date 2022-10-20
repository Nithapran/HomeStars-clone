//
//  UserService.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-29.
//

import Foundation
import Combine

enum UserServiceError: Error {
    case UserNameNotFound
}

protocol UserServiceProtocol{
    func getProfile(userName: String) -> Future< Profile?, UserServiceError>
    
}

class UserService: APIClient, UserServiceProtocol {
    
    func getProfile(userName: String) -> Future< Profile?, UserServiceError> {
        return Future { promise in
            let request = self.getBuilder().path(.getProfile(userName)).method(.get)
            RequestMiddleware.request(request: request){ (data: Profile?,error)  in
                if let error = error as? NetworkRequestError {
                    if error == .notFound {
                        promise(.failure(.UserNameNotFound))
                    }
                    
                } else {
                    promise(.success(data))
                }
            }
        }
    }
    
    
}



