//
//  PairNewDeviceViewModel.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 07/12/2021.
//

import Foundation
import NabtoEdgeClient


final class PairNewDeviceViewModel : ObservableObject{
    
    private var nabtoAccess : NabtoDeviceCoap = NabtoDeviceCoap()
    
    func localInitalPairing(_ device: Device){
        nabtoAccess.localInitalPairing(device)
    }

    func localOpenPairing(_ device: Device, _ username: String){
        nabtoAccess.localOpenPairing(device, username)
    }
    
}
