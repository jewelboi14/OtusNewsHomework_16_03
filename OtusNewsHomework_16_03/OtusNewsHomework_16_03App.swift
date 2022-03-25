//
//  OtusNewsHomework_16_03App.swift
//  OtusNewsHomework_16_03
//
//  Created by developer on 18.03.2022.
//

import SwiftUI

@main
struct OtusNewsHomework_16_03App: App {
    var body: some Scene {
        WindowGroup {
            MainSegmentedControlView()
                .environmentObject(ConfigManager.shared.router)
            
        }
    }
}

