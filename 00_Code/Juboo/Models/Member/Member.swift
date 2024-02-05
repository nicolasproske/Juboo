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

    /// Initializes a new instance of a member with provided attributes.
    /// - Parameters:
    ///   - username: The member's username.
    ///   - imageName: The name of the member's profile image. Optional.
    ///   - isOnline: A boolean indicating if the member is currently online. Defaults to false.
    ///   - lastSeenOn: The last date and time the member was seen online. Optional.
    ///   - progress: The member's progress towards the next level. Defaults to 0.0.
    ///   - badge: The member's badge. Defaults to "🎉".
    ///   - level: The member's current level. Defaults to 1.
    ///   - xp: The member's current experience points (XP). Defaults to 0.
    ///   - activities: An array of activities associated with the member. Defaults to an empty array.
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
