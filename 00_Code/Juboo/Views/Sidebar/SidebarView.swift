//
//  SidebarView.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftData
import SwiftUI

struct SidebarView: View {
    @Environment(NavigationManager.self) var navigationManager

    @Query(sort: \Chat.receiver?.username, order: .forward) var chats: [Chat]

    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(SidebarItem.allCases.filter(\.showInSidebar)) { sidebarItem in
                    let isSelected = navigationManager.currentSidebarItem == sidebarItem

                    HStack(spacing: 0) {
                        Image(systemName: sidebarItem.sfSymbol)
                            .sidebarItemImage(isSelected: isSelected)

                        Text(sidebarItem.title)
                            .sidebarItemText(isSelected: isSelected)
                    }
                    .sidebarItem(isSelected: isSelected)
                    .onTapGesture {
                        navigationManager.navigate(to: sidebarItem)
                    }
                }
            }

            VStack(alignment: .leading, spacing: 15) {
                Text("Letzte Chats")
                    .font(.system(size: 22, weight: .bold))
                    .padding(.vertical, 5)

                ForEach(chats) { chat in
                    ChatPreviewCell(chat: chat)
                }
            }

            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle(Constants.appName)
        .background(Color(.secondarySystemBackground))
    }
}
