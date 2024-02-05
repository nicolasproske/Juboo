//
//  Chat.swift
//  Juboo
//
//  Created by Nicolas Proske on 15.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Chat {
    @Relationship(deleteRule: .nullify) var sender: Member?
    @Relationship(deleteRule: .nullify) var receiver: Member?

    var messages: [Message]
    var lastOpenedOn: Date?

    /// Initializes a new instance of a chat.
    /// - Parameters:
    ///   - sender: The sender member of the chat. Defaults to nil.
    ///   - receiver: The receiver member of the chat. Defaults to nil.
    ///   - messages: An array of messages within the chat. Defaults to an empty array.
    ///   - lastOpenedOn: The date and time when the chat was last opened. Defaults to nil.
    init(sender: Member? = nil, receiver: Member? = nil, messages: [Message] = [], lastOpenedOn: Date? = nil) {
        self.sender = sender
        self.receiver = receiver
        self.messages = messages
        self.lastOpenedOn = lastOpenedOn
    }
}

extension Chat {
    /// The last message sent in the chat, if any.
    private var lastMessage: Message? {
        messages.last
    }

    /// Indicates whether there are any unread messages in the chat based on the last opened timestamp.
    var isUnread: Bool {
        lastOpenedOn ?? .now < lastMessage?.timestamp ?? .now
    }
}
