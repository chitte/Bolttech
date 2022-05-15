//
//  UsersNetworkService.swift
//  BolttechApp
//
//  Created by Veera Subhash on 15/05/22.
//

import Foundation

protocol UsersNetworkServiceProtocol {
    func getUserDetailsAPICall(completion: @escaping (Result<UserDM, ErrorType>) -> Void)
}

struct UsersNetworkService: UsersNetworkServiceProtocol {
    
    func getUserDetailsAPICall(completion: @escaping (Result<UserDM, ErrorType>) -> Void) {
        let userParams: [String: Any] = [
            "username": "v.subhashchitte@gmail.com",
            "password": "Venisha@303"
        ]
        let request = prepareUsersRequestParams(request: userParams)
        APILoader().fetchRequest(type: UserDM.self, request: request, completion: completion)
    }
    
}

extension UsersNetworkService {
    func prepareUsersRequestParams(request: [String: Any]) -> RequestAttributes {
        let urlString = BTConfiguration.getBaseURL() + "/userinfo"
                
        let requestBody = try? JSONSerialization.data(withJSONObject: request, options: .prettyPrinted)

        let requestAttributes = RequestAttributes(url: urlString, queryParams: [:], extraHeaders: nil, body: requestBody, requestMethodType: RequestMethod(rawValue: RequestMethod.post.rawValue)!)

        return requestAttributes
    }
}
