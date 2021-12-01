//
//  ContentView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 29/09/2021.
//

import SwiftUI

struct SplashscreenView: View {
    var body: some View {
        

        NavigationView
        {
            
            ZStack {
                Color("NabtoOrange")
                    .ignoresSafeArea()
                    .opacity(0.6)
                    //.navigationTitle(Text("Front"))
                
                
                NavigationLink(destination: IntroductionView(), label: {
                    Text("Nabto").font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("LightGreyText"))
                    
                })
            }
        }.navigationBarHidden(true)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashscreenView()
    }
}
