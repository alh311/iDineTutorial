//
//  iDineApp.swift
//  iDine
//
//  Created by Alex Hutchins on 3/27/23.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(order)
        }
    }
}
