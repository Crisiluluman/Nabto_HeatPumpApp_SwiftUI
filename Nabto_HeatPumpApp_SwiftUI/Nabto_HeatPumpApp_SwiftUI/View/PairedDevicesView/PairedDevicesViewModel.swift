//
//  PairedDevicesViewModel.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 15/12/2021.
//

import Foundation
import SwiftUI

final class PairedDevicesViewModel: ObservableObject{
    
    //@ObservedObject var devices: [Device] =
    
    @Published var devices: [Device] = []
    
    private var deviceAccess: NabtoDeviceCoap = NabtoDeviceCoap()
    
    init(){
        //print("Devices 1: \(devices)")
        devices = deviceAccess.userAccess.user.devices
        //print("Devices 2: \(devices)")

    }
    
    func refreshDevices(){
        print("Device count: \(devices.count)")
        devices = deviceAccess.userAccess.user.devices

    }
    
    
}
