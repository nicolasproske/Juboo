//
//  ActivityDetailView.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    let activity: Activity

    var body: some View {
        ScrollView {
            VStack {
                banner

                ZStack(alignment: .top) {
                    PageSection {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading, spacing: 0) {
                                header
                                actions
                                description
                            }

                            Spacer(minLength: 20)

                            datePicker
                        }
                        .padding(.top, 15)
                    }

                    HStack {
                        MemberGroup(members: activity.members)
                        Spacer()
                    }
                    .offset(y: -15)
                    .padding(.horizontal, 30)
                }
                .offset(y: -150)
                .padding(.horizontal)

                Spacer()
            }
        }
        .padding(.horizontal)
        .scrollIndicators(.hidden)
        .background(.mainBackground)
    }
}
