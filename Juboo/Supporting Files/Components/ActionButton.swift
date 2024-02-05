//
//  ActionButton.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    let sfSymbol: String
    let text: String
    var isSecondary = false

    var action: (() -> Void)? = nil

    var body: some View {
        if let action {
            Button {
                action()
            } label: {
                content
            }
        } else {
            content
        }
    }

    var content: some View {
        HStack {
            Image(systemName: sfSymbol)
                .resizable()
                .scaledToFit()
                .frame(width: 12, height: 12)

            Text(text)
                .font(.system(size: 14))
        }
        .fontWeight(.medium)
        .padding(.horizontal, 12)
        .padding(.vertical, 5)
        .foregroundStyle(isSecondary ? .primary : Color.white)
        .background(isSecondary ? Color(.gray.opacity(0.25)) : Color.accentColor)
        .clipShape(Capsule())
        .shadow()
    }
}
