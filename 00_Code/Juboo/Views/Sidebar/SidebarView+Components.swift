//
//  SidebarView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 05.02.24.
//  Copyright © 2024 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension SidebarView {
    struct ChatPreviewCell: View {
        @Environment(NavigationManager.self) var navigationManager

        let chat: Chat

        var body: some View {
            Button {
                navigationManager.navigate(to: .chats)
            } label: {
                HStack(spacing: 10) {
                    image

                    VStack(alignment: .leading, spacing: 1) {
                        Text(chat.receiver?.username ?? "")
                            .foregroundStyle(.primary)
                            .lineLimit(1)

                        if let lastMessage = chat.messages.sorted(by: { $0.timestamp < $1.timestamp }).last, !lastMessage.content.isEmpty {
                            Text(lastMessage.content)
                                .lineLimit(1)
                                .foregroundStyle(Color.secondary)
                        }
                    }

                    Spacer()

                    Badge(
                        text: "\(chat.messages.sorted(by: { $0.timestamp < $1.timestamp }).last?.timestamp.formatted(date: .omitted, time: .shortened) ?? "9:41") Uhr",
                        textColor: .gray,
                        backgroundColor: .gray,
                        opacity: 0.1,
                        showShadow: false
                    )
                }
                .contentShape(Rectangle())
            }
            .buttonStyle(.plain)
        }

        @ViewBuilder
        var image: some View {
            if let imageName = chat.receiver?.imageName, !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
        }
    }
}
