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
    /// The member's username.
    var username: String
    
    /// The name of the member's profile image.
    var imageName: String?
    
    /// A boolean indicating if the member is currently online.
    var isOnline: Bool
    
    /// The last date and time the member was seen online.
    var lastSeenOn: Date?
    
    /// The member's badge.
    var badge: String
    
    /// The member's progress towards the next level.
    var progress: Double
    
    /// The member's current level.
    var level: Int
    
    /// The member's current experience points (XP).
    var xp: Int

    /// An array of activities associated with the member.
    var activities: [Activity]

    /// Initializes a new instance of a member with provided attributes.
    /// - Parameters:
    ///   - username: The member's username.
    ///   - imageName: The name of the member's profile image. Optional.
    ///   - isOnline: A boolean indicating if the member is currently online. Defaults to false.
    ///   - lastSeenOn: The last date and time the member was seen online. Optional.
    ///   - badge: The member's badge. Defaults to "🎉".   
    ///   - progress: The member's progress towards the next level. Defaults to 0.0.
    ///   - level: The member's current level. Defaults to 1.
    ///   - xp: The member's current experience points (XP). Defaults to 0.
    ///   - activities: An array of activities associated with the member. Defaults to an empty array.
    init(
        username: String,
        imageName: String?,
        isOnline: Bool = false,
        lastSeenOn: Date? = nil,
        badge: String = "🎉",
        progress: Double = 0.0,
        level: Int = 1,
        xp: Int = 0,
        activities: [Activity] = []
    ) {
        self.username = username
        self.imageName = imageName
        self.isOnline = isOnline
        self.lastSeenOn = lastSeenOn
        self.badge = badge
        self.progress = progress
        self.level = level
        self.xp = xp
        self.activities = activities
    }
}
