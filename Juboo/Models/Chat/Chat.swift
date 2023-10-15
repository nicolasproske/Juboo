//
//  Chat.swift
//  Juboo
//
//  Created by Nicolas Proske on 15.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

class Chat: Identifiable {
    let id = UUID()

    var sender: Member
    var receiver: Member

    var messages: [Message]

    init(sender: Member, receiver: Member, messages: [Message]) {
        self.sender = sender
        self.receiver = receiver
        self.messages = messages
    }
}
