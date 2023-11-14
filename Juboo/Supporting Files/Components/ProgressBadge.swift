//
//  ProgressBadge.swift
//  Juboo
//
//  Created by Nicolas Proske on 15.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ProgressBadge: View {
    let member: Member

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            if !member.badge.isEmpty {
                Text(member.badge)
                    .padding(10)
                    .background(Color.primary.opacity(0.1))
                    .clipShape(Circle())
            }

            ProgressView(value: member.progress, total: 100.0)
                .progressViewStyle(.linear)

            HStack {
                Text("Level \(member.level)")
                Circle()
                    .frame(width: 4, height: 4)
                Text("\(member.progress.formatted())%")
                Spacer()
            }
            .foregroundStyle(Color.accentColor)
            .font(.system(size: 14, weight: .bold))
            .textCase(.uppercase)

            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text("\(member.xp)")
                    .font(.title)
                    .bold()

                Text("XP")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}
