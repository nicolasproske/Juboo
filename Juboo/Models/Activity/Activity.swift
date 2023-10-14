//
//  Activity.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

class Activity: Identifiable {
    let id = UUID()

    var title: String
    var takesPlaceOn: Date
    var takesPlaceAt: String
    var members: [Member]
    var maxMemberCount: Int
    var imageName: String?

    init(
        title: String,
        takesPlaceOn: Date = .now,
        takesPlaceAt: String = "",
        members _: [Member] = [],
        maxMemberCount: Int = -1,
        imageName: String? = nil
    ) {
        self.title = title
        self.takesPlaceOn = takesPlaceOn
        self.takesPlaceAt = takesPlaceAt
        members = MockData.getMembers()
        self.maxMemberCount = maxMemberCount
        self.imageName = imageName
    }
}

extension Activity {
    var isNew: Bool {
        let components = Calendar.current.dateComponents([.day], from: .now, to: takesPlaceOn)

        if let daysDifference = components.day, abs(daysDifference) < 7 {
            return abs(daysDifference) < 7
        }

        return false
    }

    var isSoon: Bool {
        let now = Date()

        if let upcoming = Calendar.current.date(byAdding: .day, value: 3, to: now) {
            return takesPlaceOn >= now && takesPlaceOn <= upcoming
        }

        return false
    }
}
