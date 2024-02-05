//
//  SidebarItemModifier.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct SidebarItemModifier: ViewModifier {
    let isSelected: Bool

    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
            .contentShape(Rectangle())
            .padding(.horizontal, 10)
            .padding(.vertical, 12)
            .background(isSelected ? Color.accentColor : nil)
            .cornerRadius(8)
    }
}

struct SidebarItemImageModifier: ViewModifier {
    let isSelected: Bool

    func body(content: Content) -> some View {
        content
            .foregroundStyle(isSelected ? .white : .accentColor)
            .frame(width: 45)
    }
}

struct SidebarItemTextModifier: ViewModifier {
    let isSelected: Bool

    func body(content: Content) -> some View {
        content
            .foregroundStyle(isSelected ? .white : .primary)
    }
}
