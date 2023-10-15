//
//  DashboardView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension DashboardView {
    var leadingContent: some View {
        ScrollView {
            VStack(spacing: 30) {
                whatsNewPageSection
                friendsPageSection
            }
            .padding(.top)
        }
        .scrollIndicators(.hidden)
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

                Text("\(activity.takesPlaceOn.formatted(date: .numeric, time: .shortened)) Uhr")
                    .foregroundStyle(.secondary)
            }
        }

        private var members: some View {
            MemberGroup(members: activity.members)
        }
    }

    var friendsPageSection: some View {
        PageSection(title: "Deine Freunde", caption: "Aktivitäten von Personen, denen du folgst") {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(MockData.getMembers(count: 2)) { member in
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

    var trailingContent: some View {
        VStack(spacing: 30) {
            progressPageSection
            ticketsPageSection

            Spacer()
        }
        .padding(.top)
        .frame(width: 320)
    }

    var progressPageSection: some View {
        PageSection(title: "Dein Fortschritt", caption: "Matche dich mit deinen Freunden") {
            ProgressBadge()
        }
    }

    var ticketsPageSection: some View {
        PageSection(title: "Deine Tickets", caption: "Alle anstehenden Aktivitäten", isContentStyled: false) {
            VStack(alignment: .leading, spacing: 15) {
                VStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("Anstehende Aktivität")
                            .foregroundStyle(Color.accentColor)
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.semibold)

                        Text("Fahrt in den Europapark")
                            .fontWeight(.semibold)

                        Text("Erlebt gemeinsam mit uns den Europapark mit mega Achterbahnen, Shows und spannenden Attraktionen.")
                            .foregroundStyle(.secondary)
                            .font(.caption)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color(.tertiarySystemBackground))

                    VStack {
                        HStack(spacing: 10) {
                            HStack(spacing: 3) {
                                Image(systemName: "calendar")
                                Text("24.07.")
                            }

                            Spacer()

                            HStack(spacing: 3) {
                                Image(systemName: "clock")
                                Text("09:00 Uhr")
                            }
                        }
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(Color.white)
                        .padding(.vertical, 3)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .frame(maxWidth: .infinity)
                    .background(Color.accentColor)
                    .cornerRadius(8)
                    .offset(y: -4)

                    Circle()
                        .fill(Color(.tertiarySystemBackground))
                        .frame(width: 32, height: 32)
                        .offset(y: -64)
                }
                .cornerRadius(8)
            }
        }
    }
}
