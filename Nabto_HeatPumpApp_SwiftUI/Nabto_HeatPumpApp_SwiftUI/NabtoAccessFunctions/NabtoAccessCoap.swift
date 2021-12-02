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
            print(error)
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
            print(error)
        }

    }
    
    
    func localOpenPairing(_ device: Device, _ username: String){
        do {
            
            try connection = client.createConnection()
            
            connect(device)
            
            let coap = try connection.createCoapRequest(method: "POST", path: "/iam/pairing/local-open")
            
            let json: [String:String] = ["Username": username]
            
            let cbor = CBOR.encode(json)
            
            
            // try! coap.setRequestPayload(contentFormat: ContentFormat.APPLICATION_CBOR.rawValue, data: Data(cbor))
            try coap.setRequestPayload(contentFormat: ContentFormat.APPLICATION_CBOR.rawValue, data: Data(cbor))
            
            let response = try coap.execute()
            
            switch response.status {
                
            case 201:
                print("Status 201: Pairing successfull/ Already Paired")
                
            case 400:
                print("Status 400: Bad request (likely invalid username)")
                
            case 403:
                print("Status 403: Blocked by IAM configuration")
                
            case 404:
                print("Status 404: Pairing mode disabled")
                
            default:
                print("Status 409: Username exists")
            
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
            print(error)
        }

    }
    
    
    func localInitalPairing(_ device: Device){
        do {
            
            try connection = client.createConnection()
            
            connect(device)
            
            let coap = try connection.createCoapRequest(method: "POST", path: "/iam/pairing/local-initial")
            

            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            
 
            let response = try coap.execute()
            
            switch response.status {
                
            case 201:
                print("Status 201: Pairing successfull")
                
            case 403:
                print("Status 403: Blocked by IAM configuration")
                
            case 404:
                print("Status 404: Pairing mode disabled")
                
            default:
                print("Status 409: Username exists")
            
            }

        }
        
        catch NabtoEdgeClientError.ALLOCATION_ERROR{
            print("SDK failed to create connection")
        }
        catch NabtoEdgeClientError.FAILED{
            print("Payload could not be set")
        }
        catch let error {
            print(error)
        }
    }
     
    
    func passwordOpenPairing(_ device: Device,_ username: String, _ password: String){
        do {
            
            try connection = client.createConnection()
            
            connect(device)
            
            let coap = try connection.createCoapRequest(method: "POST", path: "/iam/pairing/password-open")
           
            //Spørg om password/ username
            //try connection.passwordAuthenticate(username: "", password: "open-password")

            try connection.passwordAuthenticate(username: username, password: password)
            
            let json: [String:String] = ["Username": username]
            
            // let cbor = CBOR.encode(json)
            
            //try! coap.setRequestPayload(contentFormat: ContentFormat.APPLICATION_CBOR.rawValue, data: Data(cbor))
            //try coap.setRequestPayload(contentFormat: ContentFormat.APPLICATION_CBOR.rawValue, data: Data(data))
            
            let response = try coap.execute()
            
            switch response.status {
                
            case 201:
                print("Status 201: Pairing successfull")
                
            case 403:
                print("Status 403: Blocked by IAM configuration")
                
            case 404:
                print("Status 404: Pairing mode disabled")
                
            default:
                print("Status 409: Username exists")
            
            }

        }
        
        catch NabtoEdgeClientError.UNAUTHORIZED{
            print("Username or Password is invalid")
        }
        catch NabtoEdgeClientError.NOT_FOUND{
            print("Password authentication feature is not available on the device")
        }
        catch NabtoEdgeClientError.NOT_CONNECTED{
            print("Connection is not open")
        }
        catch NabtoEdgeClientError.OPERATION_IN_PROGRESS{
            print("A password authentication request is already in progress on the connection")
        }
        
        /*
         catch NabtoEdgeClientError.TOO_MANY_REQUESTS{
            print("Too many password attempts has been made")
        }
         */
        
        catch let error {
            print(error)
        }
    }
    
    
}
