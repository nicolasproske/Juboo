//
//  ChatsView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 15.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension ChatsView {
    var divider: some View {
        Divider()
            .ignoresSafeArea(edges: .vertical)
    }

    var leadingContent: some View {
        List {
            Section {
                ForEach(chats) { chat in
                    ChatSelectionCell(chat: chat, selectedChat: $selectedChat) {
                        selectChat(chat: chat)
                    }
                }
            } header: {
                Text("Offene Chats")
            }
        }
        .background(Color(.tertiarySystemBackground))
    }

    struct ChatSelectionCell: View {
        let chat: Chat
        @Binding var selectedChat: Chat
        let onSelect: () -> Void

        var isSelected: Bool {
            selectedChat == chat
        }

        var body: some View {
            Button {
                onSelect()
            } label: {
                HStack(spacing: 8) {
                    image

                    VStack(alignment: .leading, spacing: 2) {
                        Text(chat.receiver.username)
                            .foregroundColor(.primary)
                            .lineLimit(1)
                            .bold(isSelected)

                        Text(chat.messages.last?.content ?? "")
                            .lineLimit(1)
                            .foregroundStyle(chat.isUnread ? Color.accentColor : Color.secondary)
                            .bold(chat.isUnread)
                    }
                }
            }
            .listRowBackground(isSelected ? Color(.tertiarySystemBackground) : Color(.tertiarySystemBackground).opacity(0.5))
            .listRowSeparator(.hidden)
        }

        @ViewBuilder
        var image: some View {
            if let imageName = chat.receiver.imageName, !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
            }
        }
    }

    var centerContent: some View {
        VStack(spacing: 0) {
            Divider()
            chatContent
            ChatBar()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.mainBackground)
    }

    var chatContent: some View {
        ScrollView {
            VStack {
                ForEach(selectedChat.messages) { message in
                    let selfSend = message.from == selectedChat.sender

                    VStack(alignment: selfSend ? .leading : .trailing) {
                        if let imageName = message.from.imageName, !imageName.isEmpty {
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .clipShape(Circle())
                                .padding(.horizontal)
                        }

                        Text(message.content)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                            .foregroundStyle(selfSend ? Color.primary : Color.white)
                            .background(selfSend ? Color(.tertiarySystemBackground) : Color.accentColor)
                            .cornerRadius(8)

                        Text(message.timestamp.formatted(date: .numeric, time: .shortened))
                            .font(.footnote)
                            .foregroundStyle(.secondary)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity, alignment: selfSend ? .leading : .trailing)
                }
            }
            .padding(.vertical)
        }
    }

    struct ChatBar: View {
        @State private var text = ""

        var body: some View {
            HStack(spacing: 0) {
                TextField("Tippe zum Schreiben", text: $text)

                Button {
                    print("Tapped")
                } label: {
                    Image(systemName: "arrow.up")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 13, height: 13)
                        .foregroundStyle(Color.white)
                        .fontWeight(.bold)
                        .frame(width: 22, height: 22)
                        .background(Color.accentColor)
                        .clipShape(Circle())
                }
                .disabled(text.isEmpty)
            }
            .padding(.leading)
            .padding(.trailing, 10)
            .frame(height: 40)
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(20)
            .shadow()
            .padding(.bottom, 5)
        }
    }

    var trailingContent: some View {
        VStack(spacing: 0) {
            Group {
                VStack {
                    if let imageName = selectedChat.receiver.imageName, !imageName.isEmpty {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                    }

                    VStack(spacing: 2) {
                        Text(selectedChat.receiver.username)

                        HStack {
                            if Bool.random() {
                                Circle()
                                    .fill(.green)
                                    .frame(width: 8, height: 8)

                                Text("Online")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            } else {
                                Text("Zuletzt gesehen vor 2 Minuten")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                }

                ProgressBadge()
                    .padding(.horizontal)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(8)
            .shadow()
            .padding()

            Spacer()
        }
        .background(.mainBackground)
    }
}
