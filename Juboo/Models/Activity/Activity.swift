//
//  Activity.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation
import SwiftData

@Model
class Activity {
    var title: String
    var caption: String
    var takesPlaceOn: Date
    var takesPlaceAt: String
    @Relationship var members: [Member]
    var maxMemberCount: Int
    var imageName: String?
    var createdOn: Date

    init(
        title: String,
        caption: String,
        takesPlaceOn: Date = .now,
        takesPlaceAt: String = "",
        members: [Member] = [],
        maxMemberCount: Int = -1,
        imageName: String? = nil,
        createdOn: Date = .now
    ) {
        self.title = title
        self.caption = caption
        self.takesPlaceOn = takesPlaceOn
        self.takesPlaceAt = takesPlaceAt
        self.members = members
        self.maxMemberCount = maxMemberCount
        self.imageName = imageName
        self.createdOn = createdOn
    }
}

extension Activity {
    var isNew: Bool {
        let components = Calendar.current.dateComponents([.day], from: .now, to: createdOn)

        if let daysDifference = components.day, abs(daysDifference) < 7 {
            return abs(daysDifference) < 7
        }

        return false
    }

    var isSoon: Bool {
        let currentDate = Date()
        let calendar = Calendar.current

        // Start of today
        if let startOfToday = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: currentDate),
           // Start of the fourth day from today
           let startOfFourthDay = calendar.date(byAdding: .day, value: 4, to: startOfToday)
        {
            // Check if the futureDate is after the start of today and before the start of the fourth day
            return takesPlaceOn >= startOfToday && takesPlaceOn < startOfFourthDay
        }

        return false
    }

    var isDone: Bool {
        Date.now > takesPlaceOn
    }
}
