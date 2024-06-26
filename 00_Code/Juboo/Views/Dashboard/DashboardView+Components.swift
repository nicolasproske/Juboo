//
//  DashboardView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SheetKit
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
                if activities.isEmpty {
                    ContentUnavailableView("Keine Aktivitäten in deiner Nähe", systemImage: "shareplay")
                } else {
                    ForEach(activities.prefix(2)) { activity in
                        ActivityCell(activity: activity)

                        if activities.prefix(2).last != activity || activities.count > 2 {
                            Divider()
                        }
                    }

                    if activities.count > 2 {
                        Button {
                            navigationManager.navigate(to: .discover)
                        } label: {
                            Text("Mehr anzeigen")
                        }
                    }
                }
            }
        }
    }

    struct ActivityCell: View {
        @Environment(\.sheetKit) private var sheetKit

        @Environment(NavigationManager.self) var navigationManager

        let activity: Activity

        var body: some View {
            Button {
                sheetKit.present {
                    SheetWrapper {
                        ActivityDetailView(activity: activity)
                            .environment(navigationManager)
                    }
                }
            } label: {
                HStack(spacing: 15) {
                    image
                    textDescription
                    Spacer()
                    members
                }
                .foregroundColor(.primary)
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
                    .multilineTextAlignment(.leading)

                Text("\(activity.takesPlaceOn.formatted(date: .numeric, time: .shortened)) Uhr")
                    .foregroundStyle(.secondary)
            }
        }

        private var members: some View {
            MemberGroup(members: activity.members.sorted(by: { $0.username < $1.username }))
        }
    }

    var friendsPageSection: some View {
        PageSection(title: "Deine Freunde", caption: "Aktivitäten von Personen, denen du folgst") {
            VStack(alignment: .leading, spacing: 15) {
                if members.isEmpty {
                    ContentUnavailableView("Keine aktiven Freunde gefunden", systemImage: "person.fill")
                } else {
                    ForEach(members.prefix(3)) { member in
                        if let activity = activities.first(where: { $0.title == MockData.mainActivity }) {
                            Button {
                                sheetKit.present {
                                    SheetWrapper {
                                        ActivityDetailView(activity: activity)
                                            .environment(navigationManager)
                                    }
                                }
                            } label: {
                                JournalCell(member: member, description: Text("\(member.username) nimmt an **\(activity.title)** teil."))
                                    .foregroundColor(.primary)
                            }
                        }

                        if members.prefix(3).last != member {
                            Divider()
                        }
                    }
                }
            }
        }
    }

    var trailingContent: some View {
        VStack(spacing: 30) {
            progressPageSection
            rewardsPageSection
            ticketsPageSection

            Spacer()
        }
        .padding(.top)
        .frame(width: 320)
    }

    @ViewBuilder
    var progressPageSection: some View {
        if let member = memberManager.currentMember {
            PageSection(title: "Dein Fortschritt", caption: "Matche dich mit deinen Freunden") {
                ProgressBadge(member: member)
            }
        }
    }

    var rewardsPageSection: some View {
        PageSection(title: "Deine Abzeichen", caption: "Werde zum Sammler") {
            RewardsBadge()
        }
    }

    @ViewBuilder
    var ticketsPageSection: some View {
        PageSection(title: "Deine Tickets", caption: "Alle anstehenden Aktivitäten", isContentStyled: false) {
            VStack(alignment: .leading, spacing: 15) {
                if let mainActivity = activities.first(where: { $0.title == MockData.mainActivity }) {
                    TicketCell(activity: mainActivity)
                }
            }
        }
    }

    struct TicketCell: View {
        @Environment(\.sheetKit) private var sheetKit

        @Environment(NavigationManager.self) private var navigationManager

        let activity: Activity

        var body: some View {
            Button {
                sheetKit.present {
                    SheetWrapper {
                        ActivityDetailView(activity: activity)
                            .environment(navigationManager)
                    }
                }
            } label: {
                VStack(spacing: 0) {
                    VStack(alignment: .leading) {
                        Text("Anstehende Aktivität")
                            .foregroundStyle(Color.accentColor)
                            .textCase(.uppercase)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .padding(.bottom, 3)

                        Text(activity.title)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .padding(.bottom, 1)

                        Text(activity.caption)
                            .foregroundStyle(.secondary)
                            .font(.caption)
                            .lineLimit(2)
                            .padding(.bottom, 8)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background(Color(.tertiarySystemBackground))

                    VStack {
                        HStack(spacing: 10) {
                            HStack(spacing: 3) {
                                Image(systemName: "calendar")
                                Text(activity.takesPlaceOn.formatted(date: .numeric, time: .omitted))
                            }

                            Spacer()

                            HStack(spacing: 3) {
                                Image(systemName: "clock")
                                Text("\(activity.takesPlaceOn.formatted(date: .omitted, time: .shortened)) Uhr")
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
                .contentShape(Rectangle())
                .cornerRadius(8)
            }
            .buttonStyle(.plain)
        }
    }
}
