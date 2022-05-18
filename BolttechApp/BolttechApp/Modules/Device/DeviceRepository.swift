//
//  DeviceRepository.swift
//  BolttechApp
//
//  Created by Veera Subhash on 18/05/22.
//

import Foundation

class DeviceRepository {
   
    private let deviceNetworkService: DeviceNetworkServiceProtocol
    
    init(networkService: DeviceNetworkService = DeviceNetworkService()) {
        self.deviceNetworkService = networkService
    }
        
    func fetchDeviceData(completion: @escaping (Result<DeviceItems, ErrorType>) -> Void) {
        deviceNetworkService.getDeviceDetailsAPICall(completion: completion)
    }
    
}
