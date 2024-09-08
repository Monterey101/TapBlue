//
//  Tap_BlueApp.swift
//  Tap Blue
//
//  Created by Kristian Kocic on 13/4/2023.
//

import SwiftUI

@main
struct Tap_BlueApp: App {
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(.blue)]
        
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
