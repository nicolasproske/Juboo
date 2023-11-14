//
//  DashboardView.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftData
import SwiftUI

struct DashboardView: View {
    @Environment(NavigationManager.self) var navigationManager
    @Environment(MemberManager.self) var memberManager

    @Query(sort: \Activity.takesPlaceOn, order: .reverse) var activities: [Activity]
    @Query(sort: \Member.username, order: .forward) var members: [Member]

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("balloon")
                .resizable()
                .scaledToFit()
                .frame(width: 180, height: 180)
                .padding(40)

            VStack(alignment: .leading, spacing: 30) {
                HStack(spacing: 10) {
                    leadingContent
                    trailingContent
                }
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    DashboardView()
}
