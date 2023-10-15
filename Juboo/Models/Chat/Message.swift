//
//  Message.swift
//  Juboo
//
//  Created by Nicolas Proske on 15.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

class Message: Identifiable {
    let id = UUID()

    var content: String
    var from: Member
    let timestamp: Date

    init(content: String, from: Member, timestamp: Date) {
        self.content = content
        self.from = from
        self.timestamp = timestamp
    }
}
