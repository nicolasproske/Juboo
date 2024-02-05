//
//  SidebarItem.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

/// Defines sidebar items with unique identifiers, titles, symbols, and visibility in the sidebar.
enum SidebarItem: String, Identifiable, CaseIterable {
    /// The identifier for each sidebar item, derived from its raw value.
    var id: String {
        rawValue
    }

    case dashboard
    case discover
    case chats
    case profile
    case settings

    /// The title of the sidebar item.
    var title: String {
        switch self {
        case .dashboard:
            return "Dashboard"
        case .discover:
            return "Entdecken"
        case .chats:
            return "Chats"
        case .profile:
            return "Profil"
        case .settings:
            return "Einstellungen"
        }
    }

    /// The SF Symbol associated with the sidebar item.
    var sfSymbol: String {
        switch self {
        case .dashboard:
            return "squares.leading.rectangle"
        case .discover:
            return "shared.with.you"
        case .chats:
            return "bubble.left.and.bubble.right"
        case .profile:
            return "person.crop.circle"
        case .settings:
            return "gearshape"
        }
    }

    /// Determines if the sidebar item should be shown in the sidebar.
    var showInSidebar: Bool {
        // Currently, all items are shown in the sidebar.
        // This can be customized per case if needed.
        switch self {
        default:
            return true
        }
    }
}
