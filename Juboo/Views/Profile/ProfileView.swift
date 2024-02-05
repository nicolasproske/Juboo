//
//  ProfileView.swift
//  Juboo
//
//  Created by Nicolas Proske on 06.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    @Environment(NavigationManager.self) var navigationManager

    let member: Member

    let headerColumns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
    let interestColumns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)

    @State private var isFollowing = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .trailing) {
                    if member.username != MockData.username {
                        HStack {
                            ActionButton(
                                sfSymbol: isFollowing ? "minus.circle.fill" : "plus.circle.fill",
                                text: isFollowing ? "Nicht mehr folgen" : "Folgen",
                                isSecondary: isFollowing
                            ) {
                                isFollowing.toggle()
                            }

                            ActionButton(sfSymbol: "paperplane.fill", text: "Nachricht", isSecondary: !isFollowing) {
                                navigationManager.navigate(to: .chats)
                            }
                        }
                    } else {
                        ShareLink(
                            item: URL(string: "https://juboo.de/profile/\(member.id)")!,
                            preview: SharePreview("Teile das Profil von \"\(member.username)\"", image: Image(member.imageName ?? ""))
                        ) {
                            ActionButton(sfSymbol: "square.and.arrow.up", text: "Profil teilen")
                        }
                    }

                    ZStack {
                        PageSection {
                            LazyVGrid(columns: headerColumns, spacing: 15) {
                                ProgressBadge(member: member)

                                Spacer()

                                RewardsBadge()
                            }
                        }

                        memberDetailsSection
                    }
                }

                HStack(alignment: .top, spacing: 10) {
                    VStack {
                        interestsSection
                        lastRewardsSection
                    }

                    activitiesSection
                }

                Spacer()
            }
            .padding(.top, 10)
        }
        .padding()
        .scrollIndicators(.hidden)
    }
}
