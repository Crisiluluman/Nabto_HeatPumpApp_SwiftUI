//
//  DeviceMainViewModel.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 15/12/2021.
//

import Foundation
import SwiftUI

final class DeviceMainViewModel {
    
    private var userAccess : NabtoUserCoap = NabtoUserCoap()
    private var deviceAccess : NabtoDeviceCoap = NabtoDeviceCoap()


    init(){
        deviceAccess.getDevicesFromUser()
        print("Please let this be right \(userAccess.user.username)")
        print("NANI THE FLIP \(userAccess.user.devices.count)")
       // userAcces =
    }

    func testStuff(){
        print("User IS: \(userAccess.user.username)")
        print("Devices: \(userAccess.user.devices.count)")

        
        for device in userAccess.user.devices {
            print("ProductID: \(device.productId)")
            
            print("HeatPumpState \(device.heatPumpState.asJson())")
        }
    }
    
    
    
}

