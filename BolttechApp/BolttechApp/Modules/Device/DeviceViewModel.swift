//
//  DeviceViewModel.swift
//  BolttechApp
//
//  Created by Veera Subhash on 18/05/22.
//

import Foundation

class DeviceViewModel {
    
    private var deviceUseCase: DeviceUseCase
    var deviceData: DeviceItems?
    var onCompleteDevice: (() -> Void)?
    var onErrorDevice: ((_ error: ErrorType) -> Void)?
    
    init() {
        self.deviceUseCase = DeviceUseCase()
    }
    
    func loadDeviceData() {
        deviceUseCase.getDeviceData { (result: Result<DeviceItems, ErrorType>) in
            switch result {
            case .success(let data):
                debugPrint("Fetched users Device data = \(data)")
                self.deviceData = data
                self.onCompleteDevice?()
            case .failure(let error):
                debugPrint("Failed users Device data")
                self.onErrorDevice!(error)
            }
        }
    }
}
