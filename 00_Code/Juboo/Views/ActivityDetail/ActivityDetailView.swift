//
//  ActivityDetailView.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    @Environment(NavigationManager.self) var navigationManager

    let activity: Activity

    @State var isParticipating = false

    var body: some View {
        ScrollView {
            VStack {
                banner

                ZStack(alignment: .top) {
                    PageSection {
                        VStack(alignment: .leading, spacing: 0) {
                            header
                            links

                            HStack(alignment: .top) {
                                description
                                Spacer(minLength: 20)
                                datePicker
                            }
                            .padding(.top)
                        }
                        .padding(.top, 15)
                    }

                    HStack {
                        MemberGroup(members: activity.members.sorted(by: { $0.username < $1.username }))
                            .environment(navigationManager)

                        Spacer()
                        Badge(text: "+50 XP", backgroundColor: Color.accentColor, showBorder: true)
                        Badge(text: "Neu", backgroundColor: .green, showBorder: true)
                    }
                    .offset(y: -15)
                    .padding(.horizontal, 30)
                }
                .offset(y: -150)
                .padding(.horizontal)

                Spacer()
            }
        }
        .padding()
        .scrollIndicators(.hidden)
    }
}
