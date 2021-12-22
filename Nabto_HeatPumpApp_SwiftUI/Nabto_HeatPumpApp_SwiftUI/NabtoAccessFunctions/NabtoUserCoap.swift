//
//  NabtoUserCoap.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 05/12/2021.
//

import Foundation
import NabtoEdgeClient

public class NabtoUserCoap : NabtoAccessConnect, ObservableObject{
    
    @Published var user: User
    
    let userKey: String = "userKey"
    
    override init() {
        user = User(role: "", username: "")

        super.init()
        getUser()
    }

    //Converts device into data that is saved, this should be used whenever the device is editted, deleted or created
    func saveUser(){
        if let encodedData = try? JSONEncoder().encode(user){
            UserDefaults.standard.set(encodedData, forKey: userKey)
        }
        
        /*for (userKey, value) in UserDefaults.standard.dictionaryRepresentation(){
            print("\(userKey) = \(value) \n")
        }*/
        
        // print("JSON at Save: \(user.asJson())")
    }
    
    //Returns the saved user from the storage (Currently only one user)
    func getUser(){
        guard
            let data = UserDefaults.standard.data(forKey: userKey),
            let savedUser = try? JSONDecoder().decode(User.self, from: data)
        else {return}
        
        self.user = savedUser
        
        // print("JSON at Get: \(user.asJson())")

        //print("SavedUser is: \(savedUser.username)")
        //print("User is: \(self.user.username)")

    }
    
    //Creates a new user in the app
    func createAdmin(username: String){
        //Remember username must be lowercased
        do {
            let pk = try client.createPrivateKey()
            
            //Creates the user of the app as an admin
            user = User(role: "Admin", username: username.lowercased(), pk: pk)
            
            //Save user locally
            saveUser()

        }
        catch NabtoEdgeClientError.FAILED{
            print("Key could not be created")
        }
        catch let error {
            print(error)
        }
    }
    
    

}
