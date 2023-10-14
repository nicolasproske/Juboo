//
//  DiscoveryView.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct DiscoveryView: View {
    private let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(MockData.getActivities()) { activity in
                    ActivityCell(activity: activity)
                }
            }
            .padding(.top)
        }
    }
}

extension DiscoveryView {
    struct ActivityCell: View {
        let activity: Activity

        var body: some View {
            ZStack(alignment: .topLeading) {
                VStack(alignment: .leading) {
                    if let imageName = activity.imageName, !imageName.isEmpty {
                        GeometryReader { geometry in
                            Image(imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: geometry.size.width, height: 200)
                                .clipped()
                        }
                        .frame(height: 200)
                    }

                    VStack(alignment: .leading) {
                        Text(activity.title)
                            .font(.system(size: 20, weight: .semibold))
                            .lineLimit(1)

                        HStack {
                            Image(systemName: "location")
                            Text("Altstadt, 92224 Amberg")
                                .lineLimit(1)
                        }
                        .foregroundStyle(.secondary)
                    }
                    .padding()
                }
                .background(Color(.tertiarySystemBackground))
                .cornerRadius(8)
                .shadow(color: .black.opacity(0.04), radius: 5)

                MemberGroup(members: MockData.getMembers())
                    .offset(y: 180)
                    .padding(.leading)
            }
        }
    }
}

#Preview {
    DiscoveryView()
}
