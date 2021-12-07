//
//  NabtoUserCoap.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 05/12/2021.
//

import Foundation
import NabtoEdgeClient

public class NabtoUserCoap : NabtoAccessConnect{
    
    
    //Creates a new user in the app
    func createUser(username: String){
        //Remember username must be lowercased
        do {
            let pk = try client.createPrivateKey()
            
            let user = User(username: username.lowercased(), pk: pk)

        }
        catch NabtoEdgeClientError.FAILED{
            print("Key could not be created")
        }
        catch let error {
            print(error)
        }
        
        print(username.lowercased())
    }

}
