//
//  TextInputField.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct TextInputField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    var isSecure = false

    var buttonTitle = ""
    var buttonAction: (() -> Void)?

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(label)
                    .fontWeight(.semibold)

                Spacer()

                if let buttonAction, !buttonTitle.isEmpty {
                    Button {
                        buttonAction()
                    } label: {
                        Text(buttonTitle)
                    }
                }
            }
            .font(.system(size: 14))

            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 8)
            .background(Color(.tertiarySystemBackground))
            .cornerRadius(8)
            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.secondary.opacity(0.5), lineWidth: 1))
        }
    }
}

#Preview {
    TextInputField(label: "Sample label", placeholder: "Sample placeholder", text: .constant("Sample text"))
}
