//
//  HomeService.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-18.
//

import Foundation
import Combine
import RxSwift

enum HomeServiceError: Error {
    case UserNameNotFound
}

protocol HomeServiceProtocol{
    func getServices() -> Observable<[Service]?>
    func getBlogs() -> Observable<[Blog]?>
    
}


    
    
    

