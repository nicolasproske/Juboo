//
//  DiscoveryView.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import MapKit
import SwiftData
import SwiftUI

struct DiscoveryView: View {
    @Environment(\.sheetKit) private var sheetKit

    @Environment(NavigationManager.self) private var navigationManager

    @State var selectedFilterItem = FilterItem.all

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)

    @Query(sort: \Activity.takesPlaceOn, order: .reverse) var activities: [Activity]

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
                HStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(filteredActivities) { activity in
                                ActivityCell(activity: activity)
                            }
                        }
                        .padding(.top, 10)
                    }

                    Map {
                        ForEach(filteredActivities) { activity in
                            Annotation(activity.title, coordinate: CLLocationCoordinate2D(latitude: activity.latitude, longitude: activity.longitude)) {
                                ZStack {
                                    Circle()
                                        .fill(Color.gray.opacity(0.25))
                                        .frame(width: 50, height: 50)
                                        .shadow()

                                    Image(activity.imageName ?? "")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 45, height: 45)
                                        .clipShape(Circle())
                                }
                                .onTapGesture {
                                    sheetKit.present {
                                        SheetWrapper {
                                            ActivityDetailView(activity: activity)
                                                .environment(navigationManager)
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .mapStyle(.standard(pointsOfInterest: .including([.school, .university])))
                    .cornerRadius(8)
                    .padding(10)
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
