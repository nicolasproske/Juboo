//
//  Activity.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation
import MapKit
import SwiftData

@Model
class Activity {
    var title: String
    var caption: String
    var takesPlaceOn: Date
    var takesPlaceAt: String
    var latitude: Double
    var longitude: Double
    @Relationship var members: [Member]
    var maxMemberCount: Int
    var imageName: String?
    var createdOn: Date

    /// Initializes a new instance of an activity.
    /// - Parameters:
    ///   - title: The title of the activity.
    ///   - caption: A brief description of the activity.
    ///   - takesPlaceOn: The date and time when the activity takes place. Defaults to the current date and time.
    ///   - takesPlaceAt: A string representing the location where the activity takes place. Defaults to an empty string.
    ///   - latitude: The latitude of the activity's location.
    ///   - longitude: The longitude of the activity's location.
    ///   - members: A list of members participating in the activity. Defaults to an empty array.
    ///   - maxMemberCount: The maximum number of members that can participate. Defaults to -1, indicating no limit.
    ///   - imageName: An optional name of the image associated with the activity.
    ///   - createdOn: The date and time when the activity was created. Defaults to the current date and time.
    init(
        title: String,
        caption: String,
        takesPlaceOn: Date = .now,
        takesPlaceAt: String = "",
        latitude: Double,
        longitude: Double,
        members: [Member] = [],
        maxMemberCount: Int = -1,
        imageName: String? = nil,
        createdOn: Date = .now
    ) {
        self.title = title
        self.caption = caption
        self.takesPlaceOn = takesPlaceOn
        self.takesPlaceAt = takesPlaceAt
        self.latitude = latitude
        self.longitude = longitude
        self.members = members
        self.maxMemberCount = maxMemberCount
        self.imageName = imageName
        self.createdOn = createdOn
    }
}

extension Activity {
    /// Indicates whether the activity is new based on its creation date.
    var isNew: Bool {
        let components = Calendar.current.dateComponents([.day], from: .now, to: createdOn)

        if let daysDifference = components.day, abs(daysDifference) < 7 {
            return abs(daysDifference) < 7
        }

        return false
    }

    /// Indicates whether the activity is happening soon within the next three days.
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

    /// Indicates whether the activity has already taken place.
    var isDone: Bool {
        Date.now > takesPlaceOn
    }
}
