//
//  DashboardView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension DashboardView {
    var header: some View {
        HStack(spacing: 15) {
            Image("memoji-3")
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .clipShape(Circle())

            Text("Hey, Nico")
                .font(.largeTitle)
                .bold()
        }
        .padding(.horizontal, 5)
    }

    var leadingContent: some View {
        ScrollView {
            VStack(spacing: 30) {
                whatsNewPageSection
                friendsPageSection
            }
        }
    }

    var whatsNewPageSection: some View {
        PageSection(title: "Was gibt es Neues?", caption: "Neuigkeiten in deiner Umgebung") {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(MockData.getActivities()) { activity in
                    ActivityCell(activity: activity)
                    Divider()
                }

                Button {
                    print("Tapped")
                } label: {
                    Text("Mehr anzeigen")
                }
            }
        }
    }

    struct ActivityCell: View {
        let activity: Activity

        var body: some View {
            HStack(spacing: 15) {
                image
                textDescription
                Spacer()
                members
            }
        }

        @ViewBuilder private var image: some View {
            if let imageName = activity.imageName, !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 70)
                    .clipped()
                    .cornerRadius(8)
            }
        }

        private var textDescription: some View {
            VStack(alignment: .leading) {
                Text(activity.title)
                    .bold()
                    .lineLimit(1)

                Text("\(activity.takesPlaceOn.formatted(date: .numeric, time: .shortened)) Uhr")
                    .foregroundStyle(.secondary)
            }
        }

        private var members: some View {
            let members = MockData.getMembers(count: Int.random(in: 0 ... MockMember.allCases.count))
            return MemberGroup(members: members)
        }
    }

    var friendsPageSection: some View {
        PageSection(title: "Deine Freunde", caption: "Aktivitäten von Personen, denen du folgst") {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(MockData.getMembers()) { member in
                    FriendsJournalCell(member: member, description: Text("\(member.username) nimmt an **\(MockData.getActivities(count: 1).first!.title)** teil."))
                    Divider()
                }

                Button {
                    print("Tapped")
                } label: {
                    Text("Mehr anzeigen")
                }
            }
        }
    }

    struct FriendsJournalCell: View {
        let member: Member
        let description: Text

        var body: some View {
            HStack(spacing: 15) {
                image

                VStack(alignment: .leading) {
                    description
                    timestamp
                }
            }
        }

        @ViewBuilder private var image: some View {
            if let imageName = member.imageName, !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .clipShape(Circle())
            }
        }

        private var timestamp: some View {
            Text("Vor \(Int.random(in: 2 ... 59)) Minuten")
                .foregroundStyle(.secondary)
        }
    }
}
