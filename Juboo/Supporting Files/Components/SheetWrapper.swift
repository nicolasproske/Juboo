//
//  SheetWrapper.swift
//  Juboo
//
//  Created by Nicolas Proske on 05.02.24.
//  Copyright © 2024 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct SheetWrapper<Content: View>: View {
    @Environment(\.sheetKit) private var sheetKit

    @ViewBuilder var content: Content

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()

                Button {
                    sheetKit.dismiss()
                } label: {
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.25))
                            .frame(width: 32, height: 32)

                        Image(systemName: "xmark")
                            .fontWeight(.bold)
                            .foregroundStyle(.primary.opacity(0.4))
                            .frame(width: 24, height: 24)
                    }
                }
                .buttonStyle(.plain)
            }
            .padding([.top, .horizontal])

            content
        }
    }
}

#Preview {
    SheetWrapper {
        Text("Sample content")
    }
}
