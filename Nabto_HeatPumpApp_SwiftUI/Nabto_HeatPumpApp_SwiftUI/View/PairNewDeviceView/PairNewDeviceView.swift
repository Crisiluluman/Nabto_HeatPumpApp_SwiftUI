//
//  PairingInProgressView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 01/11/2021.
//

import SwiftUI
import AlertToast


struct PairNewDeviceView: View {
    
    @State private var viewModel: PairNewDeviceViewModel = PairNewDeviceViewModel()
    @State private var showToast = false
    @State private var isTapped: Bool = false
    
    @State var descriptiveName: String = ""
    
    var deviceId: String;
    var productId: String;
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("emptyImg")
                .resizable()
                .frame(width: 300.0, height: 150.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
            
            Spacer()
            
            Text("DeviceId: \(deviceId)")
                .font(.title)
                .padding(.bottom, 10.0)
                .frame(width: 300.0, alignment: .leading)
            
            
            
            Text("Descriptive name:")
                .font(.title)
                .frame(width: 300.0, alignment: .leading)
            
            
            //Textfield for the "descriptive device" name
            TextField("Descriptive name:", text: $descriptiveName)
                .padding(.vertical, 6.0)
                .padding(.horizontal, 6.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                .frame(width: 300.0, alignment: .leading)
                .font(Font.headline.weight(.bold))
                .fixedSize()
                .textInputAutocapitalization(.never)
            
            
            Text("Please give device a descriptive name. Especially important if you have access to multiple devices")
                .frame(width: 300.0, alignment: .leading)
                .padding(.vertical, 6.0)
            
            Spacer()
            
            
            HStack{
                Spacer()
                
                //Button for pairing device
                Button(action: {
                    
                    if(descriptiveName.isEmpty){
                        showToast.toggle()
                    }
                    else{
                        //TODO: Pair device, initial or localOpen?
                        
                    }
                    
                }, label: {
                    
                    Text("Pair").fontWeight(.bold)
                        .padding(20.0)
                        .foregroundColor(.white)
                }).frame(width: 100.0)
                    .background(Color("NabtoOrange"))
                    .cornerRadius(5)
                
                
                
                
                Spacer()
                
                //Cancel Button to go back to the IntroductionView
                NavigationLink(destination: IntroductionView(), isActive: $isTapped) {
                    Button(action: {
                        isTapped = true
                    }, label: {
                        
                        Text("Cancel").fontWeight(.bold)
                            .padding(20.0)
                            .foregroundColor(.white)
                    }).frame(width: 100.0)
                        .background(Color("NabtoOrange"))
                        .cornerRadius(5)
                    
                    
                }.isDetailLink(false)//.navigationBarBackButtonHidden(true)
                
                Spacer()
                
                
            }
            Spacer()
            
        }.navigationTitle("Pair device")
            .toast(isPresenting: $showToast){
                AlertToast(type: .regular, title: "Please type a device name")
            }
    }
    
    
    struct PairNewDevice_Previews: PreviewProvider {
        static var previews: some View {
            PairNewDeviceView(deviceId: "Test deviceID", productId: "Test productId")
        }
    }
}


