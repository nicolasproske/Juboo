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

    var body: some View {
        Button {
            print("Tapped")
        } label: {
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
            .background(isSecondary ? Color(.secondarySystemBackground) : Color.accentColor)
            .clipShape(Capsule())
            .shadow()
        }
    }
}
