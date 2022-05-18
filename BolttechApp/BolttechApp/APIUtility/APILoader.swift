//
//  APILoader.swift
//  BolttechApp
//
//  Created by Veera Subhash on 15/05/22.
//

import Foundation

enum ErrorType: Error {
    case BadURL
    case NoData
    case DecodingError
    case noInternet
    case serverNotReachable
    case invalidRequest
    case timeOutError
    case serviceError
    case dataError
    case urlError
    case jsonDecodeError
    case invalidToken
    case sessionExpired
    case internalServerError
    case apiError
}

class APILoader {
    let aPIHandler: APIHandlerDelegate
    let responseHandler: ResponseHandlerDelegate
    
    init(aPIHandler: APIHandlerDelegate = APIHandler(),
         responseHandler: ResponseHandlerDelegate = ResponseHandler()) {
        self.aPIHandler = aPIHandler
        self.responseHandler = responseHandler
    }
    
    func fetchRequest<T: Codable>(type: T.Type, request: RequestAttributes?, completion: @escaping(Result<T, ErrorType>) -> Void) {
        guard let url = URL(string: request?.url ?? "") else {
            return completion(.failure(.BadURL))
        }
        
        aPIHandler.fetchData(request: request!, url: url) { result in
            switch result {
            case .success(let data):
                self.responseHandler.fetchModel(type: type, data: data) { decodedResult in
                    switch decodedResult {
                    case .success(let model):
                        completion(.success(model))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
