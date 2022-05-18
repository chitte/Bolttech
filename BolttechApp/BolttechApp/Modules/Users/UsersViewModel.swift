//
//  UsersViewModel.swift
//  BolttechApp
//
//  Created by Veera Subhash on 15/05/22.
//

import Foundation

class UsersViewModel {
    
    private var usersUseCase: UsersUseCase
    var userData: UserDM?
    var onCompleteUser: (() -> Void)?
    var onErrorUser: ((_ error: ErrorType) -> Void)?
    
    init() {
        self.usersUseCase = UsersUseCase()
    }
    
    func loadUsersData() {
        usersUseCase.getUserData { (result: Result<UserDM, ErrorType>) in
            switch result {
            case .success(let data):
                debugPrint("Fetched users data")
                self.userData = data
                self.onCompleteUser?()
            case .failure(let error):
                self.onErrorUser!(error)
            }
        }
    }
}

