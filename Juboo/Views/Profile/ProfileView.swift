//
//  ProfileView.swift
//  Juboo
//
//  Created by Nicolas Proske on 06.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    let member: Member

    let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .trailing) {
                    HStack {
                        ActionButton(sfSymbol: "plus", text: "Folgen")
                        ActionButton(sfSymbol: "paperplane", text: "Nachricht")
                    }

                    ZStack {
                        PageSection {
                            LazyVGrid(columns: columns, spacing: 15) {
                                ProgressBadge(member: member)

                                Spacer()

                                rewardsSection
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
        .padding(.horizontal)
        .scrollIndicators(.hidden)
    }
}
