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
        VStack(alignment: .leading, spacing: 30) {
            header
            
            HStack(spacing: 30) {
                leadingContent
            }
            
            Spacer()
        }
        .padding(.horizontal, 40)
        .navigationTitle("Dashboard")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DashboardView()
}
