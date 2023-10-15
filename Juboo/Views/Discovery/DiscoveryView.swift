//
//  DiscoveryView.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct DiscoveryView: View {
    @State var selectedFilterItem = FilterItem.all

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
    private let activities = MockData.getActivities()

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(activities.filter { activity in
                        filterActivity(activity)
                    }) { activity in
                        ActivityCell(activity: activity)
                    }
                }
                .padding(.top, 10)
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
