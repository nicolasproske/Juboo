//
//  Message.swift
//  Juboo
//
//  Created by Nicolas Proske on 15.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Message {
    /// The text content of the message.
    var content: String
    
    /// The sender of the message.
    @Relationship(deleteRule: .nullify) var from: Member?
    
    /// The date and time when the message was sent.
    let timestamp: Date

    /// Initializes a new instance of a message.
    /// - Parameters:
    ///   - content: The text content of the message.
    ///   - from: The sender of the message. Defaults to nil if not specified.
    ///   - timestamp: The date and time when the message was sent.
    init(content: String, from: Member? = nil, timestamp: Date) {
        self.content = content
        self.from = from
        self.timestamp = timestamp
    }
}
