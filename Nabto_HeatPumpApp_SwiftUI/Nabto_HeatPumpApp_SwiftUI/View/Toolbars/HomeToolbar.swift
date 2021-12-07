//
//  HomeToolbar.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 06/12/2021.
//

import Foundation
import SwiftUI

//Toolbar used for pages using the "Home" toolbar
struct HomeToolbar: ToolbarContent{
    
    var body: some ToolbarContent{
        
        ToolbarItem(placement: .primaryAction, content: {
            NavigationLink(destination: IntroductionView()) {
                Image(systemName: "house")
                    .font(.title)
                    .foregroundColor(Color("NabtoOrange"))
                
            }.isDetailLink(false)
        })
        
    }
}

