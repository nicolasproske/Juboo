//
//  ShadowModifier.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    let opacity: CGFloat
    let radius: CGFloat

    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(opacity), radius: radius)
    }
}
