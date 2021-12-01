//
//  Device.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 13/10/2021.
//

import Foundation


// : Identifiable For unique ID's using "var id = UUID()"

struct Device : Identifiable/*: Identifiable, Hashable*/ {
    var id : UUID // Probably used for the list, so it can identify each element uniqely
    
    var productId: String
    var deviceId: String
    var readableName: String?
    
    var url: String
    var key: String
    var sct: String?

    
    //var sct: String?

   // var serverPath: String
    
    init(productId: String, deviceId: String, readableName: String?=nil, sct: String?=nil){
        id = UUID()
        self.productId = productId
        self.deviceId = deviceId
        self.readableName = "No name has been set"
        
        url = "https://pr-w34yvehn.devices.nabto.net" //pr-w34yvehn : Products
        key = "sk-e5129ab2faf1254dc55506cfc7743eab" //Another Test App'en i NabtoCloudConsole
        self.sct = sct

    }
    
    /*
     init(productId: String, deviceId: String) {
        self.productId = productId
        self.deviceId = deviceId

    }
     */
    
    
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

/*
 //
 //  Device.swift
 //  NabtoHeatPumpApp
 //
 //  Created by Christopher Larsen on 13/10/2021.
 //

 import Foundation


 // : Identifiable For unique ID's using "var id = UUID()"

 struct Device : Identifiable/*: Identifiable, Hashable*/ {
     var id = UUID() // Probably used for the list, so it can identify each element uniqely
     
     var productId: String
     var deviceId: String
     var readableName: String?
     
     var url: String
     var key: String
     var fp: String?
     var sct: String?
     var local: Bool
     
     

     init(productId: String, deviceId: String, readableName: String?=nil, url: String, key: String, fp: String?=nil, sct: String?=nil, local: Bool=false) {
         self.productId = productId
         self.deviceId = deviceId
         self.url = url
         self.key = key
         self.fp = fp
         self.sct = sct
         self.local = local
     }
 }

 */
