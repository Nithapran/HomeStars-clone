//
//  MockHomeService.swift
//  HomeStars-clone
//
//  Created by Nithaparan Francis on 2022-10-19.
//

import Foundation
import RxSwift

class MockHomeService: HomeServiceProtocol,Mockable {
    func getBlogs() -> RxSwift.Observable<[Blog]?> {
        return Observable.create { (observer) -> Disposable in
            let data = self.loadJSON(filename: "BlogsMock", type: [Blog]?.self)
            observer.onNext(data)
            observer.onCompleted()
            return Disposables.create()
        }
        
    }
    
    func getServices() -> Observable<[Service]?> {
        
        return Observable.create { (observer) -> Disposable in
            let data = self.loadJSON(filename: "HomeData", type: [Service]?.self)
            observer.onNext(data)
            observer.onCompleted()
            return Disposables.create()
        }
        
        
    }
}
