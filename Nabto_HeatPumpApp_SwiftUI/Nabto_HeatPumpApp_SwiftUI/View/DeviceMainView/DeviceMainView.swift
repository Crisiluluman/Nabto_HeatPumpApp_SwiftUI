//
//  DeviceMainView.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 15/12/2021.
//

import SwiftUI

struct DeviceMainView: View {
    
    @State private var viewModel: DeviceMainViewModel = DeviceMainViewModel()
    
    let device: Device
    
    let padding: Double = 5
    
    @State private var selector: Int? = nil
    
    init(device: Device){
        self.device = device
        
 
    }
    
    var body: some View {
        ZStack
        {
           // ScrollView{
                VStack(alignment: .center)
                {
                    //Spacer()
                    /*
                    Text("\(device.readableName ?? "Device empty")")
                        .font(.headline)
                        .padding(.bottom, 10.0)
                        .frame(width: 300.0, alignment: .center)
                    */
                     
                    Divider()
                    //Spacer()
                    
                    Image("emptyImg")
                        .resizable()
                        .frame(width: 300.0, height: 150.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    
                    Spacer()
                    //Divider()
                    Group{
                        //Spacer()
                        Text("ProductId: \(device.productId)")
                        //Spacer()
                        Text("DeviceId: \(device.deviceId)")
                        
                        Text("Device type: \(device.deviceType ?? "No type specified")")

                        //Spacer()
                        Text("Target temp: \(device.heatPumpState.target)")
                        
                        //Spacer()
                        Text("Temperature: \(device.heatPumpState.temp)")
                        
                        //Spacer()
                        Text("Power: \(device.heatPumpState.power)" as String)
                        
                        //Spacer()
                        Text("Mode: \(device.heatPumpState.heatPumpMode)" as String)
                        //Spacer()
                    }.padding(10)
                        .frame(width: 300, alignment: .leading)
                    
                    
                    Spacer()
                    
                    HStack{
                        Spacer()
                        
                        //NavigationLink is still weird in this context, but I can't execute code inside the the actual NavigationLink codeblock "{}"
                        NavigationLink(destination: DeviceSettingsView(deviceSettings: device), tag: 1, selection: $selector)
                        {
                        }
                        
                        Button(action: {
                            
                            selector = 1
  
                        }, label: {
                            
                            Text("Settings").fontWeight(.bold)
                                .padding(15.0)
                                .foregroundColor(.white)
                        }).frame(width: 120.0)
                            .background(Color("NabtoOrange"))
                            .cornerRadius(5)
                        
                        Spacer()
                        
                        Button(action: {
                            
                            //TODO: Add user functionality
                            
                            
                        }, label: {
                            
                            Text("Add User").fontWeight(.bold)
                                .padding(15.0)
                                .foregroundColor(.white)
                        }).frame(width: 120.0)
                            .background(Color("NabtoOrange"))
                            .cornerRadius(5)
                        
                        Spacer()
                    }
                    
                    Spacer()
                    
                }
           // }
        }.toolbar{MainToolbar()}
        .navigationTitle("Device: \(device.readableName ?? "No name")")
    }
}


 struct DeviceMainView_Previews: PreviewProvider {
 static var previews: some View {
 DeviceMainView(device: Device(productId: "ProdcutId: Test", deviceId: "DeviceId: Test", readableName: "TestName", deviceType: "HeatPump"))
 }
 
 }
 
