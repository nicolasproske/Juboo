//
//  ChatsView+Functions.swift
//  Juboo
//
//  Created by Nicolas Proske on 16.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

extension ChatsView {
    func selectChat(chat: Chat?) {
        selectedChat = chat

        if let selectedChat {
            selectedChat.lastOpenedOn = .now
        }
    }

    func sendMessage(text: String) {
        print(text)
    }
}
