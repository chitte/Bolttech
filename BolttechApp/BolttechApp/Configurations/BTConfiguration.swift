//
//  BTConfiguration.swift
//  BolttechApp
//
//  Created by Veera Subhash on 15/05/22.
//

import Foundation

struct BTConfiguration {
    
    static func getBaseURL() -> String {
        return APIConstant().baseUrl
    }
    
//    func set(parameters: [String: Any], urlRequest: inout URLRequest) {
//        if parameters.count != 0 {
//            if let jsonData = try? JSONSerialization.data(withJSONObject: parameters, options: []) {
//                urlRequest.httpBody = jsonData
//            }
//        }
//    }
    
    func setQueryParams(parameters: [String: Any], url: URL) -> URL {
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.map { element in URLQueryItem(name: element.key, value: String(describing: element.value) ) }
        return components?.url ?? url
    }
    
    func setHeaders(request: inout URLRequest, headerParams: [String: Any]?) {
        BTConfiguration.setBasicHeaders(urlRequest: &request) // say basic headers
        // TODO: - ADD Business Specific Headers from the argument headerParams
    }
    
    static func setBasicHeaders(isAnonymous: Bool = false, urlRequest: inout URLRequest) {
        var headers1 = urlRequest.allHTTPHeaderFields ?? [:]
        headers1["Content-Type"] = APIConstant.APIHeaders.contentTypeValue
        headers1["Authorization"] = Networking.shared.getApiAccessToken()
        urlRequest.allHTTPHeaderFields = headers1
    }
}
