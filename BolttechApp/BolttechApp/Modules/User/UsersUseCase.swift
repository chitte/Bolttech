//
//  UsersUseCase.swift
//  BolttechApp
//
//  Created by Veera Subhash on 15/05/22.
//

import Foundation

struct UsersReqestDM: Codable {
    var useremail: String = ""
    var password: String = ""
}

class UsersUseCase {
    
    private let usersRepository: UsersRepository
    
    init(repo: UsersRepository = UsersRepository()) {
        self.usersRepository = repo
    }
    
    func getUserData(completion: @escaping (Result<UserDM, ErrorType>) -> Void) {
        usersRepository.fetchUserData(completion: completion)
    }
    
}
