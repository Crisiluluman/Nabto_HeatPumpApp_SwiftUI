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
    @State private var selector: Int? = nil
    //@State private var deviceToBePaired: Device = Device(productId: "", deviceId: "")
    
    @State var descriptiveName: String = ""
    
    var deviceToBePaired: Device
    //var deviceId: String
    //var productId: String
    
    init(deviceToBePaired: Device){
        self.deviceToBePaired = deviceToBePaired
    }
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Image("emptyImg")
                .resizable()
                .frame(width: 300.0, height: 150.0)
                .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
            
            Spacer()
            
            Text("DeviceId: \(deviceToBePaired.deviceId)")
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
                NavigationLink(destination: DeviceMainView(device: deviceToBePaired), tag: 1, selection: $selector)
                {
                }
                
                //Button for pairing device
                Button(action: {
                    
                    if(descriptiveName.isEmpty){
                        showToast.toggle()
                    }
                    else{

                        //TODO: Pair device, initial or localOpen?

                        //Creates device from the data
                        //deviceToBePaired = Device(productId: productId, deviceId: deviceId, readableName: descriptiveName)
                        deviceToBePaired.readableName = descriptiveName
                        
                        
                        
                        //Pairs the device (And saves it to the user)
                        viewModel.localOpenPairing(deviceToBePaired)
                        
                        selector = 1
                        

                        
                        //Navigation is empty because it cannot hold logic, but the View will still change when called
                        //NavigationLink(destination: DeviceMainView(productId: deviceToBePaired.productId), isActive: $isTapped) {}

                        
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
                NavigationLink(destination: IntroductionView(), tag: 2, selection: $selector)
                {
                    Button(action: {
                        selector = 2
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
            
        }.navigationTitle("Pair device").toolbar{MainToolbar()}
            .toast(isPresenting: $showToast){
                AlertToast(type: .regular, title: "Please type a device name")
            }
    }
    
   /*
    struct PairNewDevice_Previews: PreviewProvider {
        static var previews: some View {
            //PairNewDeviceView(deviceId: "Test deviceID", productId: "Test productId")
        }
    }
    */
}


