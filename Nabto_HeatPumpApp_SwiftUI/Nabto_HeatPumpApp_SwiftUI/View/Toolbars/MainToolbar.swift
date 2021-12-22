//
//  ToolbarView.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 06/12/2021.
//

import SwiftUI

//Toolbar used for pages using the "Settings" and "Help" toolbar
struct MainToolbar: ToolbarContent{
    
    @State private var selector: Int? = nil
    
    var body: some ToolbarContent{
        
        ToolbarItem(placement: .primaryAction, content: {
            
            HStack
            {

                NavigationLink(destination: AppSettingsView())
                {
                    
                    Image(systemName: "questionmark.circle")
                        .font(.title)
                        .foregroundColor(Color("NabtoOrange"))
                        .frame(width: 10, height: 10)
                        .padding(20)
                    
                }
                
                NavigationLink(destination: HelpView()) {
                    
                    Image(systemName: "gearshape.fill")
                        .font(.title)
                        .foregroundColor(Color("NabtoOrange"))
                        .frame(width: 10, height: 10)
                        .padding(5)
                    
                }

                
               /*
                Button(action: {
                    // Button
                    selector = 1
                    
                    NavigationLink(destination: AppSettingsView(), tag: 1, selection: $selector)
                    {
                    }
                    
                }, label: {
                    Image(systemName: "questionmark.circle")
                        .foregroundColor(Color("NabtoOrange"))
                })
                

                Button(action: {
                    // Button
                    selector = 2
                    
                    NavigationLink(destination: HelpView(), tag: 2, selection: $selector)
                    {
                    }
                    
                }, label: {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(Color("NabtoOrange"))
                })
                */
            }
            .padding(.top, 5.0)
        })
        
    }
}




