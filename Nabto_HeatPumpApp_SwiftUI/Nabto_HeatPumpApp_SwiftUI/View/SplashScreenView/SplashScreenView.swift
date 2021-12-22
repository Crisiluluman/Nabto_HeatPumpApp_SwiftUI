//
//  ContentView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 29/09/2021.
//


import SwiftUI
/*
struct SplashscreenView: View {
    
    @State private var viewModel: SplashscreenViewModel = SplashscreenViewModel()
    
    @State private var selection: Int? = nil
    
    
    
    init(){
        if(viewModel.getUser()){
            selection = 1
        }
        
        else{
            selection = 2
        }
    }
    
    var body: some View {
        
        
        
        NavigationView
        {
            
            NavigationLink(destination: IntroductionView(), tag: 2, selection: $selection)
            {
                //Text("\(selection ?? 0)")
                //IntroductionView()
                
            }
            
            NavigationLink(destination: PairedDevicesView(_username: ""), tag: 1, selection: $selection)
            {
                //PairedDevicesView()
            }
            
            
        }.navigationBarHidden(true).accentColor((Color("NabtoOrange")))
            .navigationViewStyle(.stack)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SplashscreenView()
    }
}

final class SplashscreenViewModel{
    var deviceAccess: NabtoDeviceCoap = NabtoDeviceCoap()
    
    func getUser() -> Bool{
        if (deviceAccess.userAccess.user.username.isEmpty){
            print("FALSE")
            
            return false
        }
        else {
            print("TRUE")
            
            return true
        }
    }
    
}
*/
