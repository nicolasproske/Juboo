//
//  DashboardView.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct DashboardView: View {
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
    }
}

#Preview {
    DashboardView()
}
