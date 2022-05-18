//
//  DeviceUseCase.swift
//  BolttechApp
//
//  Created by Veera Subhash on 18/05/22.
//

import Foundation

class DeviceUseCase {
    
    private let deviceRepository: DeviceRepository
    
    init(repo: DeviceRepository = DeviceRepository()) {
        self.deviceRepository = repo
    }
    
    func getDeviceData(completion: @escaping (Result<DeviceItems, ErrorType>) -> Void) {
        deviceRepository.fetchDeviceData(completion: completion)
    }
    
}
