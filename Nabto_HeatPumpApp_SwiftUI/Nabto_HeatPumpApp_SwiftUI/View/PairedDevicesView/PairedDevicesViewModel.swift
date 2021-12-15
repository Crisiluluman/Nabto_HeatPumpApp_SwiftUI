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
    
    func displayDevices(){
        //devices = deviceAccess.devices
    }
    
    
}
