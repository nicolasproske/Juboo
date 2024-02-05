//
//  ChatsView.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftData
import SwiftUI

struct ChatsView: View {
    @Environment(\.modelContext) var context
    @Environment(\.sheetKit) var sheetKit

    @Environment(MemberManager.self) var memberManager
    @Environment(NavigationManager.self) var navigationManager

    @Query(sort: \Chat.receiver?.username, order: .forward) var chats: [Chat]

    @State var selectedChat: Chat?

    var body: some View {
        GeometryReader { geometry in
            if chats.isEmpty {
                ContentUnavailableView(
                    "Keine Chats gestartet",
                    systemImage: "bubble.left.and.bubble.right",
                    description: Text("Du hast noch mit niemandem Kontakt. Gehe auf ein Profil und sende eine Nachricht.")
                )
            } else {
                HStack(spacing: 0) {
                    leadingContent
                        .frame(width: geometry.size.width / 4)

                    divider

                    centerContent

                    divider

                    trailingContent
                        .frame(width: geometry.size.width / 4)

                    Spacer()
                }
                .onAppear {
                    if let firstChat = chats.first {
                        selectChat(chat: firstChat)
                    }
                }
            }
        }
    }
}

#Preview {
    ChatsView()
}
