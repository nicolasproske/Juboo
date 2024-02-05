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
                HStack {
                    image

                    VStack(alignment: .leading, spacing: 1) {
                        Text(chat.receiver?.username ?? "")
                            .foregroundStyle(.primary)
                            .lineLimit(1)

                        HStack(spacing: 5) {
                            if chat.receiver?.isOnline ?? false {
                                Circle()
                                    .fill(.green)
                                    .frame(width: 8, height: 8)

                                Text("Online")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            } else {
                                Group {
                                    if let lastSeenOn = chat.receiver?.lastSeenOn {
                                        Text("Zuletzt gesehen um \(lastSeenOn.formatted(date: .omitted, time: .shortened)) Uhr")
                                    } else {
                                        Text("Noch nie angemeldet")
                                    }
                                }
                                .font(.caption)
                                .foregroundStyle(.secondary)
                            }
                        }
                        .lineLimit(1)
                    }

                    Spacer()
                }
                .padding(.horizontal, 20)
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
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
            }
        }
    }
}
