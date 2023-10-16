//
//  Member.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Member {
    var username: String
    var imageName: String?
    var isOnline: Bool
    var lastSeenOn: Date?
    var badge: String
    var progress: Double
    var level: Int
    var xp: Int

    var activities: [Activity]

    init(
        username: String,
        imageName: String?,
        isOnline: Bool = false,
        lastSeenOn: Date? = nil,
        progress: Double = 0.0,
        badge: String = "🎉",
        level: Int = 1,
        xp: Int = 0,
        activities: [Activity] = []
    ) {
        self.username = username
        self.imageName = imageName
        self.isOnline = isOnline
        self.lastSeenOn = lastSeenOn
        self.progress = progress
        self.badge = badge
        self.level = level
        self.xp = xp
        self.activities = activities
    }
}
