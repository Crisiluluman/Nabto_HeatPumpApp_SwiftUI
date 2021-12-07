//
//  ToolbarView.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 06/12/2021.
//

import SwiftUI

//Toolbar used for pages using the "Settings" and "Help" toolbar
struct MainToolbar: ToolbarContent{
    
    var body: some ToolbarContent{
        
        ToolbarItem(placement: .primaryAction, content: {
            
            HStack
            {
                Button(action: {
                    // Button
                    print("Circle")
                }, label: {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(Color("NabtoOrange"))
                })
                
                Button(action: {
                    // Button
                    print("Gear")
                }, label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color("NabtoOrange"))
                })
            }
            .padding(.top, 5.0)
        })
        
    }
}




