//
//  MockData.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

final class MockData {
    static func getActivities() -> [Activity] {
        return [Activity(title: "Amberger Altstadtfest", imageName: "preview-amberg-altstadt"),
                Activity(title: "TV 1861 Amberg Turnier für Jugend", imageName: "preview-fussball"),
                Activity(title: "Übernachtung im JUZ", imageName: "preview-good-night")]
    }
    
    static func getMembers(count: Int = 3) -> [Member] {
        let allMembers = MockMember.allCases.shuffled()
        let selectedMembers = Array(allMembers.prefix(count))
        return selectedMembers.map { $0.object }
    }
}

enum MockMember: CaseIterable {
    case lukas, franzi, ollie, asam, ilayda, sophie, hannah
    
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
            return Member(username: "Ilyda", imageName: "memoji-5")
        case .sophie:
            return Member(username: "Sophie", imageName: "memoji-6")
        case .hannah:
            return Member(username: "Hannah", imageName: "memoji-7")
        }
    }
}
