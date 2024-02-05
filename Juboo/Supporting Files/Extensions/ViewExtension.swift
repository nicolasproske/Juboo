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

    func sidebarItem(isSelected: Bool) -> some View {
        modifier(SidebarItemModifier(isSelected: isSelected))
    }

    func sidebarItemImage(isSelected: Bool) -> some View {
        modifier(SidebarItemImageModifier(isSelected: isSelected))
    }

    func sidebarItemText(isSelected: Bool) -> some View {
        modifier(SidebarItemTextModifier(isSelected: isSelected))
    }

    func shadow(opacity: CGFloat = 0.08, radius: CGFloat = 5) -> some View {
        modifier(ShadowModifier(opacity: opacity, radius: radius))
    }
}
