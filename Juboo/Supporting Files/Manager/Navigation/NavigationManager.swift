//
//  NavigationManager.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SheetKit
import SwiftUI

@Observable
final class NavigationManager {
    /// The current screen the user is on. Default is `.login`.
    private(set) var currentScreen: Screen = .login

    /// The current sidebar item that is selected. Default is `.dashboard`.
    private(set) var currentSidebarItem: SidebarItem = .dashboard
}

extension NavigationManager {
    /// Navigates to a specified screen, dismissing any open sheets.
    /// - Parameter screen: The `Screen` to navigate to.
    func navigate(to screen: Screen) {
        SheetKit().dismissAllSheets()

        if currentScreen != screen {
            currentScreen = screen
        }
    }

    /// Navigates to a specified sidebar item, dismissing any open sheets.
    /// - Parameter sidebarItem: The `SidebarItem` to navigate to.
    func navigate(to sidebarItem: SidebarItem) {
        SheetKit().dismissAllSheets()

        if currentSidebarItem != sidebarItem {
            currentSidebarItem = sidebarItem
        }
    }
}
