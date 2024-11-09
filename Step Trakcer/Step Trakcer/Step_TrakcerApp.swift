//
//  Step_TrakcerApp.swift
//  Step Trakcer
//
//  Created by Cristina Andolfatto on 27/10/24.
//

import SwiftUI

@main
struct Step_TrakcerApp: App {
    /// HealthKit Manager
    /// Initialized here so we can inject this class instance in the entire app below (so every view can have access to this instance)
    let hkManager = HealthKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashBoardView()
                .environment(hkManager)
        }
    }
}
