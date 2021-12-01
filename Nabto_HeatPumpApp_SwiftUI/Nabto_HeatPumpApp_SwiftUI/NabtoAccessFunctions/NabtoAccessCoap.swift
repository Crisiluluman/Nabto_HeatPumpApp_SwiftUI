//
//  NabtoAccesCoap.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 18/11/2021.
//

import Foundation
import NabtoEdgeClient
import CBOR

public class NabtoAccessCoap{
        
    var client: Client
    var connection: Connection! = nil
    
    init(){
        client = Client()
    }
    
    //Preapares the connection for the given device
    func prepareConnect(_ device: Device){
        do {
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
        catch let error{
            print(error.localizedDescription)
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
            print(error.localizedDescription)
        }
        
        
    }
    

    //Simple Hello World Test
    func simpleCoapTest(_ device: Device){
        
        do {
            
            try connection = client.createConnection()
            
            connect(device)
            
            let coap = try connection.createCoapRequest(method: "GET", path: "/hello-world")
            
            let response = try coap.execute()
            
            let readableResponse: String = String(decoding: response.payload, as: UTF8.self)
            
            print(readableResponse)
        }
        
        catch NabtoEdgeClientError.ALLOCATION_ERROR{
            print("SDK failed to create connection")
        }
        catch let error {
            print(error.localizedDescription)
        }
    }
    
    
    func getPairing(_ device: Device){
        do {
            
            try connection = client.createConnection()
            
            connect(device)
            
            let coap = try connection.createCoapRequest(method: "GET", path: "/iam/pairing")
            
            let response = try coap.execute()
            
            if(response.status == 205){
                print("Successfull connection \n")
                
                print(String(decoding: response.payload, as: UTF8.self))
            }
            
            //Error code: 403
            else {
                print("Blocked by IAM configuration")
            }
            
        }
        
        catch NabtoEdgeClientError.ALLOCATION_ERROR{
            print("SDK failed to create connection")
        }
        catch let error {
            print(error.localizedDescription)
        }

    }
    
    
    func localOpenPairing(_ device: Device, _ username: String){
        do {
            
            try connection = client.createConnection()
            
            connect(device)
            
            let coap = try connection.createCoapRequest(method: "POST", path: "/iam/pairing/local-open")
            
            let json: [String:String] = ["Username": username]
            
            let cbor = CBOR.encode(json)
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
            let data = try encoder.encode(json)

            //let stringData = String(data: data, encoding: .utf8)!
            
            // try! coap.setRequestPayload(contentFormat: ContentFormat.APPLICATION_CBOR.rawValue, data: Data(cbor))
            //try coap.setRequestPayload(contentFormat: ContentFormat.APPLICATION_CBOR.rawValue, data: Data(data))
            
            let response = try coap.execute()
            
            switch response.status {
                
            case 201:
                print("Error 201: Pairing successfull/ Already Paired")
                
            case 400:
                print("Error 400: Bad request (likely invalid username)")
                
            case 403:
                print("Error 403: Blocked by IAM configuration")
                
            case 404:
                print("Error 404: Pairing mode disabled")
                
            default:
                print("Error 409: Username exists")
            
            }
            
            //Printing response
            //let readableResponse: String = try String(decoding: response.payload, as: UTF8.self)
            //print(readableResponse)
        }
        
        catch NabtoEdgeClientError.ALLOCATION_ERROR{
            print("SDK failed to create connection")
        }
        catch NabtoEdgeClientError.FAILED{
            print("Payload could not be set")
        }
        catch let error {
            print(error.localizedDescription)
        }

    }
    
    
    func localInitalPairing(_ device: Device){
        
        //Do stuff
    }
     
    
}
