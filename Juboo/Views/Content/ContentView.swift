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
            Group {
                switch navigationManager.currentSidebarItem {
                case .dashboard:
                    DashboardView()
                case .discover:
                    Text("Entdecken")
                case .chats:
                    Text("Chats")
                case .settings:
                    Text("Einstellungen")
                }
            }
            .background(.mainBackground)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button {
                        print("Tapped")
                    } label: {
                        Image(systemName: "questionmark.circle")
                    }

                    Button {
                        print("Tapped")
                    } label: {
                        Image(systemName: "bell")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
