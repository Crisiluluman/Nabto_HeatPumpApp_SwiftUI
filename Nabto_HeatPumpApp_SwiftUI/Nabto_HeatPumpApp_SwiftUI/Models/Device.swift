//
//  Device.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 13/10/2021.
//

import Foundation


// : Identifiable For unique ID's using "var id = UUID()"

struct Device : Identifiable, Codable {
    var id : UUID // Probably used for the list, so it can identify each element uniqely
    
    var productId: String
    var deviceId: String
    var readableName: String?
    var deviceType: String?
    
    var heatPumpState: HeatPump

    
    var url: String
    var key: String
    var sct: String?

    
    init(productId: String, deviceId: String, readableName: String?=nil, deviceType: String?=nil, sct: String?=nil){
        id = UUID()
        self.productId = productId
        self.deviceId = deviceId
        self.readableName = readableName
        self.deviceType = deviceType
        
        heatPumpState = HeatPump()

        url = "https://pr-w34yvehn.devices.nabto.net" //pr-w34yvehn : Products
        key = "sk-e5129ab2faf1254dc55506cfc7743eab" //Another Test App'en i NabtoCloudConsole
        self.sct = sct

    }
    
    
    func asJson() -> String {
        let sctElement = sct != nil ? "\"ServerConnectToken\": \"\(sct!)\",\n" : ""
        return """
               {\n
               \"ProductId\": \"\(self.productId)\",\n
               \"DeviceId\": \"\(self.deviceId)\",\n
               \"ServerUrl\": \"\(self.url)\",\n
               \(sctElement)
               \"ServerKey\": \"\(self.key)\"\n}
               """
    }
    
}



