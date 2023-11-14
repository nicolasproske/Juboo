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
        .offset(y: -60)
    }

    var rewardsSection: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 8) {
                Image("cup")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)

                Image("reward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)

                Image("certificate")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)

                Text("9+")
                    .foregroundStyle(.secondary)
                    .bold()
                    .padding(.leading, 10)
            }

            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text("12")
                    .font(.title)
                    .bold()

                Text("Abzeichen")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }

    var interestsSection: some View {
        PageSection(title: "Meine Interessen") {
            LazyVGrid(columns: columns, spacing: 15) {
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
                JournalCell(member: member, description: Text("\(member.username) hat das Abzeichen **Social Star** freigeschaltet."))
                Divider()
                JournalCell(member: member, description: Text("\(member.username) hat **3 neue Follower**."))
            }
        }
    }
}

extension ProfileView {
    struct ActionButton: View {
        let sfSymbol: String
        let text: String

        var body: some View {
            Button {
                print("Tapped")
            } label: {
                HStack {
                    Image(systemName: sfSymbol)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 12, height: 12)

                    Text(text)
                        .font(.system(size: 14))
                }
                .fontWeight(.medium)
                .padding(.horizontal, 12)
                .padding(.vertical, 5)
                .foregroundStyle(.white)
                .background(Color.accentColor)
                .clipShape(Capsule())
                .shadow()
            }
        }
    }

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
        }
    }
}
