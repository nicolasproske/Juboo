//
//  PageSection.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct PageSection<Content: View>: View {
    let title: String
    var caption: String = ""

    @ViewBuilder var content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.system(size: 20))
                    .bold()

                if !caption.isEmpty {
                    Text(caption)
                        .font(.system(size: 14))
                        .foregroundStyle(.secondary)
                }
            }
            .padding(.horizontal, 30)

            content
                .padding(25)
                .background(Color(.tertiarySystemBackground))
                .cornerRadius(8)
                .padding(5)
                .shadow(color: .black.opacity(0.025), radius: 5)
        }
    }
}
