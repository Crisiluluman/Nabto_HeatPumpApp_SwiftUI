//
//  NabtoAccesCoap.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 18/11/2021.
//

import Foundation
import NabtoEdgeClient
import CBOR
import SwiftUI

public class NabtoDeviceCoap : NabtoAccessConnect, ObservableObject {
        
    let deviceKey: String = "deviceKey"
    //private var userAccess: NabtoUserCoap = NabtoUserCoap()
    @ObservedObject var userAccess: NabtoUserCoap = NabtoUserCoap() //Er tom siger Debugger

     //@Published var devices: [Device] = []
    
    //Single user of the app atm
    //private var staticUsername: String = self.userAccess.user.username
    
    override init(){
        super.init()
        getDevicesFromUser()
        //print("Init: \(userAccess.user.devices.count) at \(userAccess.user.username)")
        //userAccess.getUser()
        //getDevicesFromUser()
        //print("Totalllllll \(userAccess.user.devices.count)")
        //devices = userAccess.user.devices
        //print("PLEAASSSEE \(devices.count)")
        //super.init()
        //getDevicesFromUser()
        
        //staticUsername = userAccess.user.username
        //print("Username at nabtoDeviceCoap: \(userAccess.user.username)")
    }

    
    //Converts device into data that is saved, this should be used whenever the device is editted, deleted or created
    func saveDevice(){
        
        if let encodedData = try? JSONEncoder().encode(userAccess.user.devices){
            UserDefaults.standard.set(encodedData, forKey: deviceKey)
        }
        
        //print("\n USERACCESS: \(userAccess.user.devices.count)\n")
        
        
        /*for (deviceKey, value) in UserDefaults.standard.dictionaryRepresentation(){
            print("\(deviceKey) = \(value) \n")
        }*/
        //getDevicesFromUser()


    }
    
    func addDeviceToUser(_ deviceToBeAdded: Device){
        self.userAccess.user.devices.append(deviceToBeAdded)
        saveDevice()
        
        //print("JSON-Device at ADD: \(deviceToBeAdded)")
        
        //print("JSON-DeviceList at ADD: \(userAccess.user.asJson())")


    }
    
    //Returns the saved user from the storage (Currently only one user)
    func getDevicesFromUser(){
        //print(" UserAccessDevices: \(userAccess.user.devices.count)")
        
        //print(" DO I GET HERE??: \(userAccess.user.username)")
        
        if let data = UserDefaults.standard.data(forKey: deviceKey) {
            //if let data = UserDefaults.standard.string(forKey: deviceKey) {
            if let decoded = try? JSONDecoder().decode([Device].self, from: data){
                self.userAccess.user.devices = decoded
                
                //print("Decoded: \(decoded.count)")
                //print("NOT Decoded: \(userAccess.user.devices.count)")

               // print("JSON-InsideGetFromUser: \(userAccess.user.asJson())")
                return
            }
        }
        
        //print("END OF IF LET: \(userAccess.user.devices.count)")
        
        /*guard
         let data = UserDefaults.standard.data(forKey: deviceKey),
         let savedDevices = try? JSONDecoder().decode([Device].self, from: data)
         else {return}*/
        
        //Saved devices indeholder alt det rigtige (Siger Debugger)
        //userAccess.user.devices = savedDevices
        
        
    }
    
    
    //Delete specific device from App (The user, as there is currently only one)
    //TODO: Only the admin can delete??
    func deleteDevice(deviceToBeDeleted: Device){
        
        if let index = userAccess.user.devices.firstIndex(where: { $0.id == deviceToBeDeleted.id }){
            userAccess.user.devices.remove(at: index)
            //TODO: Test if it works in all cases
            saveDevice()
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
    
    
    //Retrives pairing
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
    
    
    //Creates a local Open pairing
    func localOpenPairing(_ device: Device){

        do {

            let username = userAccess.user.username
            
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
            
            addDeviceToUser(device)

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
    
    
    //Initial pairing af devicet til Adminstrator
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

            addDeviceToUser(device)

            
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
     
    
    //Password pairing
    func passwordOpenPairing(_ device: Device /*,_ username: String*/, _ password: String){
        do {
            
            //Test username TODO: DELETE
            let username = ""
            
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
