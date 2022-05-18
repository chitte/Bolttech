//
//  DeviceNetworkService.swift
//  BolttechApp
//
//  Created by Veera Subhash on 18/05/22.
//

import Foundation

protocol DeviceNetworkServiceProtocol {
    func getDeviceDetailsAPICall(completion: @escaping (Result<DeviceItems, ErrorType>) -> Void)
}

struct DeviceNetworkService: DeviceNetworkServiceProtocol {
    
    func getDeviceDetailsAPICall(completion: @escaping (Result<DeviceItems, ErrorType>) -> Void) {
        let request = prepareDeviceRequestParams(request: nil)
        APILoader().fetchRequest(type: DeviceItems.self, request: request, completion: completion)
    }
    
}

extension DeviceNetworkService {
    func prepareDeviceRequestParams(request: [String: Any]?) -> RequestAttributes {
        let urlString = "https://xt12p902nb.execute-api.ap-southeast-1.amazonaws.com/dev/v1/users"
        let requestAttributes = RequestAttributes(url: urlString, queryParams: [:], extraHeaders: nil, body: nil, requestMethodType: RequestMethod(rawValue: RequestMethod.get.rawValue)!)

        return requestAttributes
    }
}
