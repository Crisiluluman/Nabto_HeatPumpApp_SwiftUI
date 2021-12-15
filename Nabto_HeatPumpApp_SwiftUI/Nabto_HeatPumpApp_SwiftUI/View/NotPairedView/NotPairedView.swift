//
//  NotPairedView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 04/10/2021.
//

import SwiftUI

struct NotPairedView: View {
    
    @State var selection: Int? = nil
        
    
    var body: some View {
        
        ZStack{
            Color("Background")
                .ignoresSafeArea()
                .opacity(0.6)
            
            
            VStack{
                
                Spacer()
                
                Image("emptyImg")
                    .resizable()
                    .frame(width: 300.0, height: 300.0)
                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                
                Divider()
                Spacer()
                
                //Goes to the "DiscoverDevicesView()" view
                NavigationLink(destination: DiscoverDevicesView(), tag: 1, selection: $selection)
                {
                    Button(action: {
                        self.selection  = 1
                    }) {
                        Text("Pair New Device")
                            .fontWeight(.bold)
                            .padding(20.0)
                            .foregroundColor(.white)
                    }
                    
                }.frame(width: 300.0).background(Color("NabtoOrange"))
                    .cornerRadius(5)
                
                
                
                
                Spacer()
                
                //Should go to a view with some "User pairing"
                //TODO: Make the view
                NavigationLink(destination: IntroductionView(), tag: 2, selection: $selection)
                {
                    Button(action: {
                        self.selection  = 2
                    }) {
                        Text("Ask for access to existing device")
                            .fontWeight(.bold)
                            .padding(20.0)
                            .foregroundColor(.white)
                    }.frame(width: 300.0)                            .background(Color("NabtoOrange"))
                        .cornerRadius(5)
                    
                }
                Spacer()
                
            }.toolbar{MainToolbar()}
            .navigationViewStyle(StackNavigationViewStyle())
            .navigationTitle("My devices").font(.subheadline)
            
            
        }
        
    }
}

//Preview testing stuff

/*
struct NotPairedView_Previews: PreviewProvider {
   
    
}
*/
