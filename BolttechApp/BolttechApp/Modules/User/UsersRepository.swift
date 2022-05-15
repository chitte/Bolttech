//
//  UsersRepository.swift
//  BolttechApp
//
//  Created by Veera Subhash on 15/05/22.
//

import Foundation

class UsersRepository {
   
    private let usersNetworkService: UsersNetworkServiceProtocol
    
    init(networkService: UsersNetworkServiceProtocol = UsersNetworkService()) {
        self.usersNetworkService = networkService
    }
        
    func fetchUserData(completion: @escaping (Result<UserDM, ErrorType>) -> Void) {
        usersNetworkService.getUserDetailsAPICall(completion: completion)
    }
    
}

