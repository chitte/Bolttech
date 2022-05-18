//
//  Networking.swift
//  BolttechApp
//
//  Created by Veera Subhash on 18/05/22.
//

import Foundation

class Networking {
    static let shared = Networking()
    var token: String = ""
    var idToken: String = ""
    
    func getApiAccessToken() -> String {
        return "Bearer \(self.token)"
    }
    
    func getApiIDToken() -> String {
        return "Bearer \(self.idToken)"
    }
}
