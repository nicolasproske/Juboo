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
    var content: String
    @Relationship(deleteRule: .nullify) var from: Member?
    let timestamp: Date

    init(content: String, from: Member? = nil, timestamp: Date) {
        self.content = content
        self.from = from
        self.timestamp = timestamp
    }
}
