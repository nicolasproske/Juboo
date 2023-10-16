//
//  DiscoveryView.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftData
import SwiftUI

struct DiscoveryView: View {
    @State var selectedFilterItem = FilterItem.all

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)

    @Query var activities: [Activity]

    var filteredActivities: [Activity] {
        activities.filter { activity in
            filterActivity(activity)
        }
    }

    var body: some View {
        VStack(spacing: 0) {
            if filteredActivities.isEmpty {
                ContentUnavailableView(
                    "Keine Aktivitäten in deiner Nähe",
                    systemImage: "shareplay",
                    description: Text("In deiner Umgebung werden noch keine Aktivitäten mit den ausgewählten Filterkriterien angeboten.")
                )
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(filteredActivities) { activity in
                            ActivityCell(activity: activity)
                        }
                    }
                    .padding(.top, 10)
                }
            }
        }
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .principal) {
                filter
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    DiscoveryView()
}
