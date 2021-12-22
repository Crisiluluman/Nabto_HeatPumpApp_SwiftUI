//
//  IntroductionViewModel.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 05/12/2021.
//

import Foundation

final class IntroductionViewModel {
    
    private var userAccess : NabtoUserCoap = NabtoUserCoap()
    private var deviceAcces: NabtoDeviceCoap = NabtoDeviceCoap()
    
     func createAdmin(username: String){
         userAccess.createAdmin(username: username)
    }
    
    func getUsername() -> String{
        return deviceAcces.userAccess.user.username
    }
    
    //Resets Userdefaults (TEST STUFF)
    func resetUserdefaults(){
        // Write/Set Boolean in User Defaults
        UserDefaults.standard.set(true, forKey: "deviceKey")
        UserDefaults.standard.set(true, forKey: "userKey")

        // Before Resetting User Defaults
        print("userkey before", UserDefaults.standard.bool(forKey: "userKey"))
        print("devicekey before", UserDefaults.standard.bool(forKey: "deviceKey"))

        // Reset Standard User Defaults
        UserDefaults.resetStandardUserDefaults()

        // After Resetting User Defaults
        print("userkey after", UserDefaults.standard.bool(forKey: "userKey"))
        print("devicekey after", UserDefaults.standard.bool(forKey: "deviceKey"))

    }
    
}
