//
//  PairedDevicesView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 04/10/2021.
//

import SwiftUI


//Currently not used?
struct PairedDevicesView: View {
    
    @StateObject private var viewModel: PairedDevicesViewModel = PairedDevicesViewModel()
    @State private var isTapped = false

    
    var body: some View {
        
        NavigationView{

            List(viewModel.devices)
            {
                device in
                NavigationLink(destination: DeviceMainView(productId: device.productId), isActive: $isTapped)
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
                        isTapped = true
                    }
                }
            }
            
        }.toolbar{MainToolbar()}
        
        
    }
}

struct PairedDevicesView_Previews: PreviewProvider {
    static var previews: some View {
        PairedDevicesView()
    }
}
