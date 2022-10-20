//
//  Profile.swift
//  GitHubApp
//
//  Created by Nithaparan Francis on 2022-09-30.
//

import Foundation

struct Profile: Codable {
    var name: String
    var location: String
    var memberSince: String
    var email: String
    var phoneNumber: String
    var postalCode: String
    var image: String
    
    func getMemberSinceString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        let date = dateFormatter.date(from: self.memberSince) ?? Date()
        return "• Member since " + dateFormatter.string(from: date)
    }
   
        
}
