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
    @Environment(MemberManager.self) var memberManager

    var body: some View {
        NavigationSplitView {
            SidebarView()
        } detail: {
            Group {
                switch navigationManager.currentSidebarItem {
                case .dashboard:
                    DashboardView()
                case .discover:
                    DiscoveryView()
                case .chats:
                    ChatsView()
                case .settings:
                    Text("Einstellungen")
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .background(.mainBackground)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    HStack(spacing: 10) {
                        if let imageName = memberManager.currentMember?.imageName, !imageName.isEmpty {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                        }

                        Text(memberManager.currentMember?.username ?? "Benutzer nicht gefunden")
                            .bold()
                    }
                }
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

                    Button {
                        navigationManager.navigate(to: .login)
                    } label: {
                        Image(systemName: "arrow.up.forward.app")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
