//
//  ProgressBadge.swift
//  Juboo
//
//  Created by Nicolas Proske on 15.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ProgressBadge: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("🥈")
                .padding(5)
                .background(.gray.opacity(0.5))
                .clipShape(Circle())

            ProgressView(value: 75.0, total: 100.0)
                .progressViewStyle(.linear)

            HStack {
                Text("Level 2")
                Circle()
                    .frame(width: 4, height: 4)
                Text("75 %")
                Spacer()
            }
            .foregroundStyle(Color.accentColor)
            .font(.system(size: 14, weight: .bold))
            .textCase(.uppercase)

            HStack(alignment: .firstTextBaseline, spacing: 3) {
                Text("750")
                    .font(.title)
                    .bold()

                Text("XP")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}
