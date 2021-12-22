//
//  PairedDevicesView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 04/10/2021.
//

import SwiftUI


//Currently not used?
struct PairedDevicesView: View {
    
    @ObservedObject private var viewModel: PairedDevicesViewModel = PairedDevicesViewModel()
    
    @State private var selection: Int? = nil

    @State var username: String
    
    
    var body: some View {
        
        // NavigationView{
        
        Spacer()
        
        Image("emptyImg")
            .resizable()
            .frame(width: 300.0, height: 150.0)
            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
        
        Spacer()
        Divider()
        
        
        //TODO: Crashes on the 14th element for some reason
        List(viewModel.devices)
        {
            device in
            NavigationLink(destination: DeviceMainView(device: device), tag: 1, selection: $selection)
            {
                HStack {
                    Image("emptyImg")
                        .resizable()
                        .frame(width: 30.0, height: 30.0)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                    Spacer()
                    VStack(alignment: .leading) {
                        
                        Text("ProductID:  \(device.productId)")
                        Text("DeviceID:  \(device.deviceId )")
                        Text("Type:  \(String(describing: device.deviceType))")
                        
                        
                    }
                }.onTapGesture {
                    selection = 1
                }
            }
        }
        
        Spacer()
        Divider()
        Spacer()
        
        HStack{
            Spacer()

            Button(action: {
                viewModel.refreshDevices()
            }, label: {
                
                Text("Refresh").fontWeight(.bold)
                    .padding(20.0)
                    .foregroundColor(.white)
            }).frame(width: 170.0)
                .background(Color("NabtoOrange"))
                .cornerRadius(5)
            
            Spacer()

            NavigationLink(destination: DiscoverDevicesView(), tag: 2, selection: $selection){
                Button(action: {
                    selection = 2
                }, label: {
                    
                    Text("Pair new device").fontWeight(.bold)
                        .padding(20.0)
                        .foregroundColor(.white)
                }).frame(width: 170.0)
                    .background(Color("NabtoOrange"))
                    .cornerRadius(5)
            }
            Spacer()
            
        }.toolbar{MainToolbar()}
                .navigationTitle("My devices")
        Spacer()

    }

    
}

struct PairedDevicesView_Previews: PreviewProvider {
    static var previews: some View {
        PairedDevicesView(username: "Test Username")
    }
}
