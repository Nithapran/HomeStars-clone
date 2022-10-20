//
//  MockUserService.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-20.
//

import Foundation
import RxSwift

class MockUserService: UserServiceProtocol,Mockable {
    func getProfile() -> Observable<Profile?> {
        return Observable.create { (observer) -> Disposable in
            let data = self.loadJSON(filename: "ProfileMock", type: Profile?.self)
            observer.onNext(data)
            observer.onCompleted()
            return Disposables.create()
        }
        
    }
}
