//
//  ContentView.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var navigationManager = NavigationManager()

    var body: some View {
        Group {
            switch navigationManager.currentScreen {
            case .login:
                LoginView()
            case .main:
                Text("Test")
            }
        }
        .environment(navigationManager)
    }
}

#Preview {
    ContentView()
}
