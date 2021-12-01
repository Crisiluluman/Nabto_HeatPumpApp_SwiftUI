//
//  PairingInProgressView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 01/11/2021.
//

import SwiftUI

import NabtoEdgeClient

private var nabtoAccess : NabtoAccessCoap = NabtoAccessCoap()

struct PairNewDevice: View {
    
    
    var deviceId: String;
    var productId: String;
    
    
    @State var descriptiveName: String = ""

    
    var body: some View {
        VStack {
                     
            Spacer()
            
            Text("DeviceId: \(deviceId)")
                .font(.largeTitle)
            
            Spacer()
                        
            Text("Descriptive name")
                .font(.largeTitle)
                        
            TextField("Descriptive name:", text: $descriptiveName)
                .padding(.leading, 50)
                .padding(.trailing, 50)
                .padding(.top, 6)
                .padding(.bottom, 6)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.leading)
                .font(Font.headline.weight(.bold))
                .fixedSize()
            
            
            Text("Please give device a descriptive name. Especially important if you have access to multiple devices")
            
            
            Spacer()
            
             Button(action: {
                
                 let testDevice: Device = Device(productId: productId, deviceId: deviceId, readableName: descriptiveName)
                 
                // nabtoAccess.getPairing(testDevice)
                 
                 nabtoAccess.localOpenPairing(testDevice, descriptiveName)
                     

                
            }, label: {
                
                Text("Pair").fontWeight(.bold)
                    .padding(5.0)
                    .background(Color("NabtoOrange"))
                    .foregroundColor(.white)
                    .cornerRadius(5)
            })
            
            Spacer()
             
        }
    }

    
    
}

