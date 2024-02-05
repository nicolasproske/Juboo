//
//  JubooApp.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftData
import SwiftUI

@main
struct JubooApp: App {
    @State private var navigationManager = NavigationManager()
    @State private var memberManager = MemberManager()

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
        .environment(memberManager)
        .modelContainer(for: [Activity.self, Chat.self, Member.self, Message.self])
    }
}
