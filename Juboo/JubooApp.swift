//
//  JubooApp.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

@main
struct JubooApp: App {
    @State private var navigationManager = NavigationManager()

    var body: some Scene {
        WindowGroup {
            switch navigationManager.currentScreen {
            case .login:
                LoginView()
            case .main:
                ContentView()
            }
        }
        .environment(navigationManager)
    }
}
