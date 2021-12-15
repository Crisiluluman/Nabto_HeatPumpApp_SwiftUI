//
//  HeatPump.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 12/12/2021.
//

import Foundation


struct HeatPump : Codable {
    
    
    enum HeatPumpMode: Codable{
        case HEAT_PUMP_MODE_COOL
        case HEAT_PUMP_MODE_HEAT
        case HEAT_PUMP_MODE_DRY
        case HEAT_PUMP_MODE_FAN
    }
    
    
    var power : Bool //On or Off
    var target : Double //Target temperature
    var temp: Double
    var heatPumpMode: HeatPumpMode
    
    init(power: Bool, target: Double,temp: Double, heatPumpMode: HeatPumpMode){
        self.power = power
        self.target = target
        self.temp = temp
        self.heatPumpMode = heatPumpMode
    }
    
    
    //Empty constructor for initializing
    //TODO: Test
    init(){
        power = false
        target = 26.0
        temp = 26.0
        heatPumpMode = HeatPumpMode.HEAT_PUMP_MODE_COOL
    }
    

    

    
    func asJson() -> String {
        return """
                   {\n
                   \"MODE\": \"\(self.heatPumpMode)\",\n
                   \"Power\": \"\(self.power)\",\n
                   \"Target\": \"\(self.target)\",\n
                   \"Temperature\": \"\(self.temp)\"
                   \n}
                   """
    }
    

    
    
}
