//
//  DeviceMainView.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 15/12/2021.
//

import SwiftUI

struct DeviceMainView: View {
    
    @State private var viewModel: DeviceMainViewModel = DeviceMainViewModel()
    
    var productId: String
    
    var body: some View {
        ZStack{
            Text(productId)
            
            Button(action: {
                
                viewModel.testStuff()
                
                
            }, label: {
                
                Text("Click").fontWeight(.bold)
                    .padding(20.0)
                    .foregroundColor(.white)
            }).frame(width: 100.0)
                .background(Color("NabtoOrange"))
                .cornerRadius(5)
            
        }.toolbar{MainToolbar()}
    }
}

struct DeviceMainView_Previews: PreviewProvider {
    static var previews: some View {
        DeviceMainView(productId: "Test device product")
    }
}
