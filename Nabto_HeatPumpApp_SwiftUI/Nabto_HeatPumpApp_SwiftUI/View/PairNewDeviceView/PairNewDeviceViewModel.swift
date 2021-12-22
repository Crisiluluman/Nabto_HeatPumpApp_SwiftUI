//
//  PairNewDeviceViewModel.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 07/12/2021.
//

import Foundation
import NabtoEdgeClient


final class PairNewDeviceViewModel : ObservableObject{
    
    private var deviceAccess : NabtoDeviceCoap = NabtoDeviceCoap()
    
    func localInitalPairing(_ device: Device){
        deviceAccess.localInitalPairing(device)
    }

    func localOpenPairing(_ device: Device){
        deviceAccess.localOpenPairing(device)
    }
    
    /*func getCurrentUserRole()-> String{
        return deviceAccess.userAccess.user.role
    }
     */
}
