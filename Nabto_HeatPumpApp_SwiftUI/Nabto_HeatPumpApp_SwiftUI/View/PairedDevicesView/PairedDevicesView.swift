//
//  PairedDevicesView.swift
//  NabtoHeatPumpApp
//
//  Created by Christopher Larsen on 04/10/2021.
//

import SwiftUI


//Currently not used?
struct PairedDevicesView: View {
    
    var body: some View {
        
        NavigationView{

            Text("Paired Devices")
            
        }.toolbar{MainToolbar()}
        
        
    }
}

struct PairedDevicesView_Previews: PreviewProvider {
    static var previews: some View {
        PairedDevicesView()
    }
}
