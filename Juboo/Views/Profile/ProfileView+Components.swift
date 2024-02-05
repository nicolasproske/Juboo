//
//  ProfileView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension ProfileView {
    var memberDetailsSection: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(Color(.tertiarySystemBackground))
                    .frame(width: 110, height: 110)

                if let imageName = member.imageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
            }

            Text(member.username)
                .font(.system(size: 20, weight: .semibold))

            Text("53 Freunde")
                .font(.footnote)
                .foregroundStyle(.secondary)
        }
        .offset(y: -50)
    }

    var interestsSection: some View {
        PageSection(title: "Meine Interessen") {
            LazyVGrid(columns: interestColumns, spacing: 15) {
                InterestBadge(text: "Basketball 🏀", color: .orange)
                InterestBadge(text: "Natur 🪴", color: .green)
                InterestBadge(text: "Kreativität 🎭", color: .blue)
                InterestBadge(text: "Lesen 📚", color: .red)
                InterestBadge(text: "Brettspiele 🎲", color: .gray)
            }
        }
    }

    var lastRewardsSection: some View {
        PageSection(title: "Kürzlich erhaltene Abzeichen") {
            HStack {
                Spacer()

                TrophyBadge(image: "heart", title: "Social Star", caption: "Mehr als 50 Freunde", timestamp: .now)

                Spacer()

                TrophyBadge(image: "cup", title: "Fußball-Profi", caption: "5 Turniere gewonnen", timestamp: .now)

                Spacer()
            }
        }
    }

    var activitiesSection: some View {
        PageSection(title: "Aktivitäten") {
            VStack(alignment: .leading) {
                JournalCell(member: member, description: Text("\(member.username) hat das Abzeichen **Social Star** freigeschaltet."), isNavigationActive: false)
                Divider()
                JournalCell(member: member, description: Text("\(member.username) hat **3 neue Follower**."), isNavigationActive: false)
            }
        }
    }
}

extension ProfileView {
    struct InterestBadge: View {
        let text: String
        let color: Color

        var body: some View {
            Badge(text: text, textColor: color, backgroundColor: color, opacity: 0.1, showShadow: false, fullWidth: true)
        }
    }

    struct TrophyBadge: View {
        let image: String
        let title: String
        let caption: String
        let timestamp: Date

        var body: some View {
            VStack {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 64, height: 64)
                    .padding(.bottom, 10)

                Text(title)
                    .font(.system(size: 16, weight: .bold))

                Group {
                    Text(caption)
                        .foregroundStyle(.secondary)

                    Text(timestamp.formatted(date: .numeric, time: .omitted))
                        .foregroundStyle(Color.accentColor)
                }
                .font(.footnote)
            }
            .multilineTextAlignment(.center)
        }
    }
}
