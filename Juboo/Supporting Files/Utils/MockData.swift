//
//  MockData.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

final class MockData {
    static func getActivities(count: Int = 3) -> [Activity] {
        let allActivities = MockActivity.allCases.shuffled()
        let selectedActivities = Array(allActivities.prefix(count))
        return selectedActivities.map(\.object)
    }

    static func getMembers(count: Int = Int.random(in: 0 ... MockMember.allCases.count)) -> [Member] {
        let allMembers = MockMember.allCases.shuffled()
        let selectedMembers = Array(allMembers.prefix(count))
        return selectedMembers.map(\.object)
    }
}

enum MockActivity: CaseIterable {
    case altstadtfest
    case fussballturnier
    case uebernachtung_juz

    var object: Activity {
        switch self {
        case .altstadtfest:
            return Activity(title: "Amberger Altstadtfest", takesPlaceAt: "Altstadt Amberg", imageName: "preview-amberg-altstadt")
        case .fussballturnier:
            return Activity(title: "TV 1861 Amberg Turnier für Jugend", takesPlaceAt: "Sportplatz Amberg", imageName: "preview-fussball")
        case .uebernachtung_juz:
            return Activity(title: "Übernachtung im JUZ", takesPlaceAt: "Jugendzentrum Amberg", maxMemberCount: 50, imageName: "preview-good-night")
        }
    }
}

enum MockMember: CaseIterable {
    case lukas
    case franzi
    case ollie
    case asam
    case ilayda
    case sophie
    case hannah

    var object: Member {
        switch self {
        case .lukas:
            return Member(username: "Lukas", imageName: "memoji-1")
        case .franzi:
            return Member(username: "Franzi", imageName: "memoji-2")
        case .ollie:
            return Member(username: "Ollie", imageName: "memoji-3")
        case .asam:
            return Member(username: "Asam", imageName: "memoji-4")
        case .ilayda:
            return Member(username: "Ilayda", imageName: "memoji-5")
        case .sophie:
            return Member(username: "Sophie", imageName: "memoji-6")
        case .hannah:
            return Member(username: "Hannah", imageName: "memoji-7")
        }
    }
}
