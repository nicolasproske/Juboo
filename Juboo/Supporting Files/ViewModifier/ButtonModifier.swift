//
//  ButtonModifier.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ButtonInnerModifier: ViewModifier {
    let fillSpace: Bool

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: fillSpace ? .infinity : nil)
            .padding(.vertical, 2)
    }
}

struct ProminentButtonOuterModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle(radius: 8))
    }
}

struct BorderedButtonOuterModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .buttonStyle(.bordered)
            .buttonBorderShape(.roundedRectangle(radius: 8))
    }
}
