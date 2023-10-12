//
//  SidebarItem.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

enum SidebarItem: String, Identifiable, CaseIterable {
    var id: String {
        rawValue
    }

    case dashboard
    case discover
    case chats
    case settings

    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .discover:
            return "Entdecken"
        case .chats:
            return "Chats"
        case .settings:
            return "Einstellungen"
        }
    }

    var sfSymbol: String {
        switch self {
        case .dashboard:
            return "squares.leading.rectangle"
        case .discover:
            return "shareplay"
        case .chats:
            return "bubble.left.and.bubble.right"
        case .settings:
            return "gearshape"
        }
    }
}
