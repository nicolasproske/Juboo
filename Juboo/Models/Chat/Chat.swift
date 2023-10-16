//
//  Chat.swift
//  Juboo
//
//  Created by Nicolas Proske on 15.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

class Chat: Identifiable, Equatable {
    static func == (lhs: Chat, rhs: Chat) -> Bool {
        lhs.sender == rhs.sender
    }

    let id = UUID()

    var sender: Member
    var receiver: Member

    var messages: [Message]
    var lastOpenedOn: Date?

    init(sender: Member, receiver: Member, messages: [Message], lastOpenedOn: Date?) {
        self.sender = sender
        self.receiver = receiver
        self.messages = messages
        self.lastOpenedOn = lastOpenedOn
    }
}

extension Chat {
    private var lastMessage: Message? {
        messages.last
    }

    var isUnread: Bool {
        lastOpenedOn ?? .now < lastMessage?.timestamp ?? .now
    }
}
