//
//  DiscoveryView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension DiscoveryView {
    var filter: some View {
        Picker("Filter", selection: $selectedFilterItem) {
            ForEach(FilterItem.allCases) { filterItem in
                Text(filterItem.title)
                    .tag(filterItem)
            }
        }
        .pickerStyle(.segmented)
        .padding(.bottom, 10)
    }

    struct ActivityCell: View {
        let activity: Activity

        var body: some View {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    image
                    content
                }
                .background(Color(.tertiarySystemBackground))
                .cornerRadius(8)
                .shadow()

                MemberGroup(members: activity.members)
                    .offset(y: 180)
                    .padding(.leading)
            }
        }

        @ViewBuilder private var image: some View {
            if let imageName = activity.imageName, !imageName.isEmpty {
                GeometryReader { geometry in
                    ZStack(alignment: .topLeading) {
                        Image(imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: 200)
                            .clipped()

                        HStack {
                            if activity.isDone {
                                Badge(text: "Abgelaufen", backgroundColor: .red)
                            } else {
                                if activity.isNew {
                                    Badge(text: "Neu", backgroundColor: .green)
                                }

                                if activity.maxMemberCount > 0 {
                                    let remaining = activity.maxMemberCount - activity.members.count
                                    Badge(text: "Noch \(remaining) freie\(remaining == 1 ? "r Platz" : " Plätze")")
                                }
                            }
                        }
                        .shadow(opacity: 0.2, radius: 15)
                        .padding()
                    }
                }
                .frame(height: 200)
            }
        }

        private var content: some View {
            VStack(alignment: .leading) {
                Text(activity.title)
                    .font(.system(size: 20, weight: .semibold))
                    .lineLimit(1)

                Group {
                    HStack {
                        Image(systemName: "clock")
                            .frame(width: 15)

                        Text("\(activity.takesPlaceOn.formatted(date: .numeric, time: .shortened)) Uhr")
                    }

                    HStack {
                        Image(systemName: "location")
                            .frame(width: 15)

                        Text(activity.takesPlaceAt)
                    }
                }
                .lineLimit(1)
                .font(.footnote)
                .foregroundStyle(.secondary)
            }
            .padding()
        }
    }
}
