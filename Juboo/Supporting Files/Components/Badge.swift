//
//  Badge.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct Badge: View {
    let text: String
    var textColor: Color = .white
    var backgroundColor: Color = .accentColor
    var opacity: CGFloat = 1.0
    var showShadow = true
    var showBorder = false
    var fullWidth = false

    var body: some View {
        Text(text)
            .lineLimit(1)
            .font(.system(size: 12, weight: .semibold))
            .foregroundStyle(textColor)
            .shadow(opacity: showShadow ? 0.25 : 0.0, radius: 2.5)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .frame(maxWidth: fullWidth ? .infinity : nil)
            .background(backgroundColor.opacity(opacity))
            .cornerRadius(6)
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color(.tertiarySystemBackground), lineWidth: showBorder ? 4 : 0)
            )
    }
}

#Preview {
    Badge(text: "Sample text", backgroundColor: .green)
}
