//
//  TestCodable.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 15/12/2021.
//

import Foundation


//WHY DOES CODABLE WORK HERE
struct Patty: Codable{
    
    var yum: String
}

struct Letttuce: Codable{
    
    var healthy: Bool
}

struct Burger: Codable{
    
    var patty: Patty
}

