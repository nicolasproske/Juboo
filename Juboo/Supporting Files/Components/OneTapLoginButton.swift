//
//  OneTapLoginButton.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct OneTapLoginButton: View {
    let image: String
    let label: String

    var body: some View {
        Button {
            print("Tapped")
        } label: {
            if !image.isEmpty {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            } else {
                Text(label)
            }
        }
        .padding(.horizontal, 35)
        .padding(.vertical, 15)
        .frame(maxWidth: .infinity)
        .contentShape(Rectangle())
        .background(.white)
        .cornerRadius(8)
        .overlay(RoundedRectangle(cornerRadius: 8).stroke(.secondary.opacity(0.5), lineWidth: 1))
    }
}

#Preview {
    OneTapLoginButton(image: "sample-image", label: "Sample label")
}
