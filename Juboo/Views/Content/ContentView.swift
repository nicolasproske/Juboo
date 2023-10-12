//
//  ContentView.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(NavigationManager.self) var navigationManager

    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            switch navigationManager.currentSidebarItem {
            case .dashboard:
                DashboardView()
            case .discover:
                Text("Discover")
            case .chats:
                Text("Chats")
            case .settings:
                Text("Einstellungen")
            }
        }
    }
}

#Preview {
    ContentView()
}
