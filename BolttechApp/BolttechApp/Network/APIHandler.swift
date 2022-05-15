//
//  APIHandler.swift
//  BolttechApp
//
//  Created by Veera Subhash on 15/05/22.
//

import Foundation

public enum RequestMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

struct RequestAttributes {
    let url: String
    let queryParams: [String: Any]
    let extraHeaders: [String: Any]?
    let body: Data?
    let requestMethodType: RequestMethod
}

protocol APIHandlerDelegate {
    func fetchData(request: RequestAttributes, url: URL, completion: @escaping(Result<Data, ErrorType>) -> Void)
}

class APIHandler: APIHandlerDelegate {
    func fetchData(request: RequestAttributes, url: URL, completion: @escaping(Result<Data, ErrorType>) -> Void) {
        if var url = URL(string: request.url) {
            if request.queryParams.count > 0 {
                url = BTConfiguration().setQueryParams(parameters: request.queryParams, url: url)
            }
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = request.requestMethodType.rawValue
            urlRequest.httpBody = request.body
            
            BTConfiguration().setHeaders(request: &urlRequest, headerParams: request.extraHeaders)
            
            URLSession.shared.dataTask(with: urlRequest) { data, response, error in
                guard let data = data, error == nil else {
                    if error != nil, error?.localizedDescription == "The Internet connection appears to be offline." {
                        return completion(.failure(.noInternet))
                    } else {
                        return completion(.failure(.dataError))
                    }
                }
                completion(.success(data))
            }
            .resume()
            
        } else {
            completion(.failure(.urlError))
            return
        }
        
    }
}

protocol ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, ErrorType>) -> Void)
}

class ResponseHandler: ResponseHandlerDelegate {
    func fetchModel<T: Codable>(type: T.Type, data: Data, completion: (Result<T, ErrorType>) -> Void) {
        let commentResponse = try? JSONDecoder().decode(type.self, from: data)
        if let commentResponse = commentResponse {
            return completion(.success(commentResponse))
        } else {
            completion(.failure(.jsonDecodeError))
        }
    }
}
