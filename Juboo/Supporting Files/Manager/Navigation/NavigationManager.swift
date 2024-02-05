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
    private(set) var currentScreen: Screen = .login
    private(set) var currentSidebarItem: SidebarItem = .dashboard
}

extension NavigationManager {
    func navigate(to screen: Screen) {
        SheetKit().dismissAllSheets()

        if currentScreen != screen {
            currentScreen = screen
        }
    }

    func navigate(to sidebarItem: SidebarItem) {
        SheetKit().dismissAllSheets()

        if currentSidebarItem != sidebarItem {
            currentSidebarItem = sidebarItem
        }
    }
}
