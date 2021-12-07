//
//  User.swift
//  Nabto_HeatPumpApp_SwiftUI
//
//  Created by Christopher Larsen on 03/12/2021.
//

import Foundation

struct User {
    
    var id : UUID // Probably used for the list, so it can identify each element uniqely
    
    var username: String
    var sct: String?
    var pk: String?

    
    init(username: String, pk: String?=nil, sct: String?=nil){
        id = UUID()
        self.username = username
        self.pk = pk
        self.sct = sct
    }
    
    func asJson() -> String {
        let sctElement = sct != nil ? "\"ServerConnectToken\": \"\(sct!)\",\n" : ""
        return """
                   {\n
                   \"Username\": \"\(self.username)\",\n
                   \(sctElement)
                   \n}
                   """
    }
    
    
    
}
