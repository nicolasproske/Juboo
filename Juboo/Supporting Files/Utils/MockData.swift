//
//  MockData.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

final class MockData {
    static let username = MockObject.ollie.username
    static let mainActivity = MockObject.uebernachtung_juz.title

    static func getActivities(count: Int = MockActivity.allCases.count) -> [Activity] {
        let allActivities = MockActivity.allCases.shuffled()
        let selectedActivities = Array(allActivities.prefix(count))
        return selectedActivities.map(\.object)
    }

    static func getMembers(count: Int = MockMember.allCases.count) -> [Member] {
        let allMembers = MockMember.allCases.filter { $0.object.username != MockData.username }.shuffled()
        let selectedMembers = Array(allMembers.prefix(count))
        return selectedMembers.map(\.object)
    }

    static func getChats(count: Int = MockChat.allCases.count) -> [Chat] {
        let allChats = MockChat.allCases.shuffled()
        let selectedChats = Array(allChats.prefix(count))
        return selectedChats.map(\.object)
    }
}

enum MockActivity: CaseIterable {
    case altstadtfest
    case fussballturnier
    case uebernachtung_juz

    var object: Activity {
        switch self {
        case .altstadtfest:
            return MockObject.altstadtfest
        case .fussballturnier:
            return MockObject.fussballturnier
        case .uebernachtung_juz:
            return MockObject.uebernachtung_juz
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
            return MockObject.lukas
        case .franzi:
            return MockObject.franzi
        case .ollie:
            return MockObject.ollie
        case .asam:
            return MockObject.asam
        case .ilayda:
            return MockObject.ilayda
        case .sophie:
            return MockObject.sophie
        case .hannah:
            return MockObject.hannah
        }
    }
}

enum MockChat: CaseIterable {
    case asam
    case ilayda

    var object: Chat {
        switch self {
        case .asam:
            return MockObject.chat_asam
        case .ilayda:
            return MockObject.chat_ilayda
        }
    }
}

enum MockObject {
    static let altstadtfest = Activity(
        title: "Amberger Altstadtfest",
        caption: "Die kulinarische Vielfalt reicht von Bratwürsten über Brezn und Backwaren aller Art bis hin zu Lángos, Döner, und diversen Süßwaren. Neben einem Pils Pavillon und einem Weinstand gibt es Cocktails aller Art an der Colomba-Bar. Zum Ausschank kommen die gepflegten Biere der Brauerei Bruckmüller.",
        takesPlaceOn: Calendar.current.date(byAdding: .day, value: Int.random(in: 1 ... 30), to: Date())!,
        takesPlaceAt: "Altstadt Amberg",
        latitude: 49.445226,
        longitude: 11.858055,
        imageName: "preview-amberg-altstadt"
    )
    static let fussballturnier = Activity(
        title: "TV 1861 Amberg Turnier für Jugend",
        caption: "Nach langer Pause geht es wieder los. News und Interviews aus den Reihen des TV 1861 Amberg.",
        takesPlaceOn: Calendar.current.date(byAdding: .day, value: Int.random(in: 1 ... 30), to: Date())!,
        takesPlaceAt: "Sportplatz Amberg",
        latitude: 49.436350,
        longitude: 11.867080,
        members: [MockObject.lukas],
        imageName: "preview-fussball"
    )
    static let uebernachtung_juz = Activity(
        title: "Übernachtung im JUZ",
        caption: "Einmal im Monat bietet das JUZ wieder allen Jugendlichen die Möglichkeit einen gemeinsamen Abend mit Übernachtung und Frühstück im JUZ / Turnhalle zu,verbringen. Natürlich ist auch für ein Rahmenprogramm gesorgt.",
        takesPlaceOn: Calendar.current.date(byAdding: .day, value: Int.random(in: 1 ... 30), to: Date())!,
        takesPlaceAt: "Jugendzentrum Amberg",
        latitude: 49.4348342,
        longitude: 11.8671583,
        members: [MockObject.asam, MockObject.franzi, MockObject.sophie],
        maxMemberCount: 50,
        imageName: "preview-good-night"
    )

    static let lukas = Member(username: "Lukas", imageName: "memoji-1", isOnline: true, progress: 80.0, badge: "💡", level: 8, xp: 625)
    static let franzi = Member(username: "Franzi", imageName: "memoji-2", isOnline: true, lastSeenOn: .now, progress: 25.0, badge: "🔮", level: 6, xp: 125)
    static let ollie = Member(username: "Ollie", imageName: "memoji-3", lastSeenOn: Date(timeIntervalSince1970: 0), progress: 10.0, badge: "🚀", level: 12, xp: 50)
    static let asam = Member(username: "Asam", imageName: "memoji-4", lastSeenOn: .now, progress: 40.0, badge: "🎁", level: 3, xp: 320)
    static let ilayda = Member(username: "Ilayda", imageName: "memoji-5", isOnline: true, lastSeenOn: .now, progress: 65.0, badge: "🥇", level: 1, xp: 490)
    static let sophie = Member(username: "Sophie", imageName: "memoji-6", progress: 50.0, badge: "🎉", level: 3, xp: 375)
    static let hannah = Member(username: "Hannah", imageName: "memoji-7", lastSeenOn: Date(timeIntervalSince1970: 0), progress: 90.0, badge: "🕹", level: 5, xp: 800)

    static let chat_asam = Chat(
        sender: MockObject.ollie,
        receiver: MockObject.asam,
        messages: [
            Message(
                content: "Hey Ollie, hast vielleicht mal wieder Lust, eines der neuen Angebote der Jugendarbeit auszuprobieren? 😇",
                from: MockObject.asam,
                timestamp: Date(timeIntervalSinceNow: -100)
            ),
            Message(content: "Hi Asam! Klar, super gerne. An was hättest du denn gedacht?",
                    from: MockObject.ollie,
                    timestamp: Date(timeIntervalSinceNow: -99)),
            Message(content: "Ich hätte ja mal wieder Lust auf einen Freizeitpark, wie findest du das? 🏰",
                    from: MockObject.ollie,
                    timestamp: Date(timeIntervalSinceNow: -98)),
            Message(content: "Klingt nach einem Plan! 🤩 Ich schicke dir gleich mal coole Aktivitäten mit Achterbahnen...",
                    from: MockObject.asam,
                    timestamp: Date(timeIntervalSinceNow: -97))
        ],
        lastOpenedOn: Date(timeIntervalSinceNow: -100)
    )

    static let chat_ilayda = Chat(
        sender: MockObject.ollie,
        receiver: MockObject.ilayda,
        messages: [
            Message(
                content: "Na, wie gehts? Bist du ab und zu noch im JUZ, hab dich schon länger nicht mehr gesehen? 👀",
                from: MockObject.ollie,
                timestamp: Date(timeIntervalSinceNow: -200)
            ),
            Message(content: "Alles gut bei mir, wie gehts dir? Schön, dass du dich meldest... ich hatte die letzten Wochen eine stressige Prüfungsphase. 🪫",
                    from: MockObject.ilayda,
                    timestamp: Date(timeIntervalSinceNow: -199)),
            Message(content: "Soweit alles bestens. Oh, ist alles gut gelaufen und wann bist du fertig?",
                    from: MockObject.ollie,
                    timestamp: Date(timeIntervalSinceNow: -198)),
            Message(content: "Übermorgen ist alles rum, zum Glück. Danach können wir uns gerne mal treffen, wann hättest du Zeit?",
                    from: MockObject.ilayda,
                    timestamp: Date(timeIntervalSinceNow: -197)),
            Message(content: "Diesen Samstag um circa 12 Uhr am JUZ?",
                    from: MockObject.ollie,
                    timestamp: Date(timeIntervalSinceNow: -196)),
            Message(content: "Passt, machen wir. Ich freu mich! Bis dann 👋",
                    from: MockObject.ilayda,
                    timestamp: Date(timeIntervalSinceNow: -195))
        ],
        lastOpenedOn: Date(timeIntervalSinceNow: -200)
    )
}
