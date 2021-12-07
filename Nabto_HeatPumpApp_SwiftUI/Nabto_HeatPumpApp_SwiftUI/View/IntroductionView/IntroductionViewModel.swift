//
//  IntroductionViewModel.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 05/12/2021.
//

import Foundation

final class IntroductionViewModel {
    
    private var nabtoAccess : NabtoUserCoap = NabtoUserCoap()
    
     func createUser(username: String){
         nabtoAccess.createUser(username: username)
    }
    
}
