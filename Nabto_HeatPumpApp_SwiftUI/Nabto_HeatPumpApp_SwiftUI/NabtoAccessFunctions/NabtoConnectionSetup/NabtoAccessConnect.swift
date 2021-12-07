//
//  NabtoAccessConnect.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 05/12/2021.
//

import Foundation
import NabtoEdgeClient

/*
This code is used by both the NabtoDeviceCoap and NabtoUserCoap class,
so instead of writing the same code twice, this is just an exension class
*/

public class NabtoAccessConnect {
    
    var client: Client
    var connection: Connection! = nil
    
    init(){
        client = Client()
    }
    
    //Preapares the connection for the given device
    func prepareConnect(_ device: Device){
        do {
            
            //Skal der laves PK her???
            let key = try client.createPrivateKey()

            try connection.setPrivateKey(key: key)
            try connection.updateOptions(json: device.asJson())

        }
        catch NabtoEdgeClientError.FAILED{
            print("Key could not be created")
        }
        catch NabtoEdgeClientError.INVALID_STATE{
            print("Connection not in setup phase")
        }
        catch NabtoEdgeClientError.INVALID_ARGUMENT{
            print("Input is invalid")
        }
        catch let error {
            print(error)
        }
        
    }
    
    
    //Establishes connectiong for the given device
    func connect(_ device: Device){
        do {
            prepareConnect(device)
            try connection.connect()
        }
        catch NabtoEdgeClientError.UNAUTHORIZED{
            print("Authentication option do not match the basestation configuration")
        }
        catch NabtoEdgeClientError.TOKEN_REJECTED{
            print("Could not validate specific token")
        }
        catch let error {
            print(error)
        }
        
        
    }
}
