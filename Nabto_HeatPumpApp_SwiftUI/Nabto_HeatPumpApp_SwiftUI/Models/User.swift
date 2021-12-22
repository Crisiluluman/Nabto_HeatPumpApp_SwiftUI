//
//  User.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 03/12/2021.
//

import Foundation
import SwiftUI

struct User: Codable {
    
    var id : UUID // Probably used for the list, so it can identify each element uniqely
    
    var role: String
    var username: String
    var sct: String?
    
    var pk: String?
    var devices: [Device]

    
    init(role: String, username: String, pk: String?=nil, sct: String?=nil){
        id = UUID()
        self.role = role
        self.username = username
        self.pk = pk
        self.sct = sct
        
        devices = []
        
        //let testDevice = Device(productId: "TestProductId", deviceId: "TestDeviceId", readableName: "PumpXYZ", deviceType: "TestPump")
        //devices.append(testDevice)
        
    }
    
    func asJson() -> String {
        let sctElement = sct != nil ? "\"ServerConnectToken\": \"\(sct!)\",\n" : ""
        return """
                   {\n
                   \"Role\": \"\(self.role)\",\n
                   \"Username\": \"\(self.username)\",\n
                   \"Devices\": \"\(self.devices)\",\n
                   \(sctElement)
                   \n}
                   """
    }
    
    
    
}
