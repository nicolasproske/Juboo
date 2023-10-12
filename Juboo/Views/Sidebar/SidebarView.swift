//
//  SidebarView.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct SidebarView: View {
    @Environment(NavigationManager.self) var navigationManager

    var body: some View {
        VStack(spacing: 0) {
            ForEach(SidebarItem.allCases) { sidebarItem in
                let isSelected = navigationManager.currentSidebarItem == sidebarItem

                HStack(spacing: 0) {
                    Image(systemName: sidebarItem.sfSymbol)
                        .sidebarItemImage(isSelected: isSelected)

                    Text(sidebarItem.title)
                        .sidebarItemText(isSelected: isSelected)
                }
                .sidebarItem(isSelected: isSelected)
                .onTapGesture {
                    navigationManager.navigate(to: sidebarItem)
                }
            }

            Spacer()
        }
        .padding(.horizontal)
        .navigationTitle(Constants.appName)
        .background(Color(.secondarySystemBackground))
    }
}

#Preview {
    SidebarView()
}
