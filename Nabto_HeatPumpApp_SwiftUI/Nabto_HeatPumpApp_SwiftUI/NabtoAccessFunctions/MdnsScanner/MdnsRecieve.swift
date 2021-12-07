//
//  MdnsRecieve.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 05/12/2021.
//

import Foundation
import NabtoEdgeClient

/*TODO: Currently not working, trying to seperate the MdnsScanner from the "DiscoveredDevicesView"
public class MdnsRecieve: MdnsResultReceiver , ObservableObject {
    
    var recieve = MdnsRecieve()
    
    @Published var discoveredDevices : [Device] = []
    
    var client: Client
    var scanner: MdnsScanner
    
    init(){
        client = Client()
        scanner = client.createMdnsScanner()
        
        
        do {
            //scanner.addMdnsResultReceiver(recieve())

            try scanner.start()
            print("Scanner is started")
            
        }catch NabtoEdgeClientError.INVALID_ARGUMENT{
            print("Invalid level")
        }
        catch NabtoEdgeClientError.INVALID_STATE{
            print("The scan could not be started, e.g. the client is being stopped")
        }
        catch let error{
            print(error)
        }
    }
    
    
    public func stopScanner(){
        scanner.stop()
    }
    
    public func onResultReady(result: MdnsResult) {
        print("Do i get here?")
        
        DispatchQueue.main.async()
        {
            
            let resultProductId : String = result.productId
            let resultDeviceId : String = result.deviceId
            
            let device: Device = Device(productId: resultProductId, deviceId: resultDeviceId)
            
            self.discoveredDevices.append(device)
            
            
        }
    }
}
*/
