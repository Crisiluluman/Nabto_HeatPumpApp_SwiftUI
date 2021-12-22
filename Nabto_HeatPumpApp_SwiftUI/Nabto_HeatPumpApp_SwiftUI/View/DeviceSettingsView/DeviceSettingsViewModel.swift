//
//  DeviceSettingsViewModel.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 21/12/2021.
//

import Foundation

final class DeviceSettingsViewModel{
    
    private var deviceAcces: NabtoDeviceCoap = NabtoDeviceCoap()
    
    func deleteDevice(deviceToBeDeleted: Device){
        deviceAcces.deleteDevice(deviceToBeDeleted: deviceToBeDeleted)
    }
}
