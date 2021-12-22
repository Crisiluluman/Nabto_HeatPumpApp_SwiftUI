    //
    //  DeviceSettingsView.swift
    //  Nabto_HeatPumpApp_SwiftUI
    //
    //  Created by Christopher Larsen on 21/12/2021.
    //

    import SwiftUI

    struct DeviceSettingsView: View {
        
        @State private var viewModel: DeviceSettingsViewModel = DeviceSettingsViewModel()
        
        let deviceSettings: Device
        
        @State private var selector: Int? = nil
        
        
        init(deviceSettings: Device){
            self.deviceSettings = deviceSettings
            
            
        }
        var body: some View {
            
            VStack{
                Group{
                    //Spacer()
                    Text("ProductId:\n\(deviceSettings.productId)")
                    //Spacer()
                    Text("DeviceId:\n\(deviceSettings.deviceId)")
                    
                    //Spacer()
                    Text("Target temp:\n\(deviceSettings.heatPumpState.target)")
                    
                    //Spacer()
                    Text("Temperature:\n\(deviceSettings.heatPumpState.temp)")
                    
                    //Spacer()
                    Text("Power:\n\(deviceSettings.heatPumpState.power)" as String)
                    
                    //Spacer()
                    Text("Mode: \n\(deviceSettings.heatPumpState.heatPumpMode)" as String)
                    //Spacer()
                }.padding(10)
                    .frame(width: 300, alignment: .leading)
                
                Divider()
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        
                        //selector = 1

                    }, label: {
                        
                        Text("Security").fontWeight(.bold)
                            .padding(15.0)
                            .foregroundColor(.white)
                    }).frame(width: 110.0)
                        .background(Color("NabtoOrange"))
                        .cornerRadius(5)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        viewModel.deleteDevice(deviceToBeDeleted: deviceSettings)
                        
                        /*selector = 3
                        
                        NavigationLink(destination: PairedDevicesView(), tag: 3, selection: $selector)
                        {
                        }
                         */
                        
                    }, label: {
                        
                        Text("Delete").fontWeight(.bold)
                            .padding(15.0)
                            .foregroundColor(.white)
                    }).frame(width: 110.0)
                        .background(Color("NabtoOrange"))
                        .cornerRadius(5)
                    
                    Spacer()
                    
                    Button(action: {
                        
                        //TODO: Add user functionality
                        //selector = 2

                        
                    }, label: {
                        
                        Text("Add User").fontWeight(.bold)
                            .padding(15.0)
                            .foregroundColor(.white)
                    }).frame(width: 110.0)
                        .background(Color("NabtoOrange"))
                        .cornerRadius(5)
                    Spacer()
                }
                
            }.toolbar{MainToolbar()}
            .navigationTitle("Settings")
        }
        
    }

    struct DeviceSettingsView_Previews: PreviewProvider {
        static var previews: some View {
            DeviceSettingsView(deviceSettings: Device(productId: "TestProductID", deviceId: "TestDeviceID", readableName: "TestPump1", deviceType: "HeatPump"))
        }
    }
