//
//  IntroductionViewModel.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 05/12/2021.
//

import Foundation

final class IntroductionViewModel {
    
    private var userAccess : NabtoUserCoap = NabtoUserCoap()
    
     func createAdmin(username: String){
         userAccess.createAdmin(username: username)
    }
    
    func getUser() -> Bool{
        if (userAccess.user == nil){
            return true
        }
        else {
            return false
        }
    }

    
}
