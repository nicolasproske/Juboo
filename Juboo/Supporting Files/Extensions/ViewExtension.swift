//
//  ViewExtension.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension View {
    /// Applies an inner button style.
    /// - Parameter fillSpace: A Boolean value that determines if the button should fill the available space.
    /// - Returns: A view styled with the `ButtonInnerModifier`.
    func buttonInner(fillSpace: Bool = true) -> some View {
        modifier(ButtonInnerModifier(fillSpace: fillSpace))
    }

    /// Applies a prominent outer button style.
    /// - Returns: A view styled with the `ProminentButtonOuterModifier`.
    func prominentButtonOuter() -> some View {
        modifier(ProminentButtonOuterModifier())
    }

    /// Applies a bordered outer button style.
    /// - Returns: A view styled with the `BorderedButtonOuterModifier`.
    func borderedButtonOuter() -> some View {
        modifier(BorderedButtonOuterModifier())
    }

    /// Applies styling for a sidebar item based on selection state.
    /// - Parameter isSelected: A Boolean value that indicates whether the sidebar item is selected.
    /// - Returns: A view styled with the `SidebarItemModifier`.
    func sidebarItem(isSelected: Bool) -> some View {
        modifier(SidebarItemModifier(isSelected: isSelected))
    }

    /// Applies styling for a sidebar item's image based on selection state.
    /// - Parameter isSelected: A Boolean value that indicates whether the sidebar item is selected.
    /// - Returns: A view styled with the `SidebarItemImageModifier`.
    func sidebarItemImage(isSelected: Bool) -> some View {
        modifier(SidebarItemImageModifier(isSelected: isSelected))
    }

    /// Applies styling for a sidebar item's text based on selection state.
    /// - Parameter isSelected: A Boolean value that indicates whether the sidebar item is selected.
    /// - Returns: A view styled with the `SidebarItemTextModifier`.
    func sidebarItemText(isSelected: Bool) -> some View {
        modifier(SidebarItemTextModifier(isSelected: isSelected))
    }

    /// Applies a shadow effect to the view.
    /// - Parameters:
    ///   - opacity: The opacity of the shadow. Defaults to 0.08.
    ///   - radius: The blur radius of the shadow. Defaults to 5 points.
    /// - Returns: A view styled with the `ShadowModifier`.
    func shadow(opacity: CGFloat = 0.08, radius: CGFloat = 5) -> some View {
        modifier(ShadowModifier(opacity: opacity, radius: radius))
    }
}
