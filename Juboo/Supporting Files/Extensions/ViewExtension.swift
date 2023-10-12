//
//  ViewExtension.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension View {
    func buttonInner(fillSpace: Bool = true) -> some View {
        modifier(ButtonInnerModifier(fillSpace: fillSpace))
    }

    func prominentButtonOuter() -> some View {
        modifier(ProminentButtonOuterModifier())
    }

    func borderedButtonOuter() -> some View {
        modifier(BorderedButtonOuterModifier())
    }
}
