//
//  DashboardView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension DashboardView {
    var header: some View {
        Text("Hey, Nico")
            .font(.largeTitle)
            .bold()
    }
    
    var leadingContent: some View {
        VStack(spacing: 30) {
            whatsNewPageSection
        }
    }
    
    var whatsNewPageSection: some View {
        PageSection(title: "Was gibt es Neues?", caption: "Neuigkeiten in deiner Umgebung") {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(MockData.getActivities()) { activity in
                    ActivityCell(activity: activity)
                    Divider()
                }
                
                Button {
                    print("Tapped")
                } label: {
                    Text("40 weitere Neuigkeiten anzeigen")
                }
                
            }
        }
    }
    
    struct ActivityCell: View {
        let activity: Activity
        
        var body: some View {
            HStack(spacing: 15) {
                image
                textDescription
                Spacer()
                members
            }
        }
        
        @ViewBuilder private var image: some View {
            if let imageName = activity.imageName, !imageName.isEmpty {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 70)
                    .clipped()
                    .cornerRadius(8)
            }
        }
        
        private var textDescription: some View {
            VStack(alignment: .leading) {
                Text(activity.title)
                    .bold()
                
                Text("\(activity.takesPlaceOn.formatted(date: .numeric, time: .shortened)) Uhr")
                    .foregroundStyle(.secondary)
            }
        }
        
        private var members: some View {
            let members = MockData.getMembers(count: 5)
            return MemberGroup(members: members)
        }
    }
}
