//
//  ServerViewModel.swift
//  ShapesCurvesCustomSheet
//
//  Created by Maxim Macari on 08/11/2020.
//

import SwiftUI

class ServerViewModel: ObservableObject {
    
    @Published var servers = [
        Server(name: "United States", flag: "us"),
        Server(name: "India", flag: "in"),
        Server(name: "Unidet Kingdom", flag: "uk"),
        Server(name: "France", flag: "fr"),
        Server(name: "Germany", flag: "ge"),
        Server(name: "Singapore", flag: "si")
    ]
    
    @Published var isConnected = false
    @Published var showSheet = false
    
    @Published var currentServer: Server = Server(name: "United States", flag: "us")
    
}

