//
//  HeatPumpStateView.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 12/12/2021.
//

import SwiftUI

struct HeatPumpStateView: View {
    
    @ObservedObject private var viewModel: HeatPumpStateViewModel = HeatPumpStateViewModel()
    
    @State var temp: String
    
    
    
    init(){
        //Initialize data from HeatPumpState
        temp = "20"
        
    }
    
    
    var body: some View {

        Text("Temp: \(temp)")
    }
}

struct HeatPumpStateView_Previews: PreviewProvider {
    static var previews: some View {
        HeatPumpStateView()
    }
}
