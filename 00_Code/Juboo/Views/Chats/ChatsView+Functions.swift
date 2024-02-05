//
//  ChatsView+Functions.swift
//  Juboo
//
//  Created by Nicolas Proske on 16.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

extension ChatsView {
    /// Selects a chat and updates its last opened timestamp.
    /// - Parameter chat: The `Chat` object to be selected. If `nil`, it deselects the current chat.
    func selectChat(chat: Chat?) {
        selectedChat = chat

        // If a chat is selected, update its last opened timestamp to now.
        if let selectedChat {
            selectedChat.lastOpenedOn = .now
        }
    }

    /// Sends a message with the given text.
    /// - Parameter text: The text of the message to be sent.
    func sendMessage(text: String) {
        // Implementation to send a message. Currently, it prints the text to the console.
        // This should be replaced with actual message sending logic.
        print(text)
    }
}
