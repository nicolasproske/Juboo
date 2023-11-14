//
//  ContentView+Components.swift
//  Juboo
//
//  Created by Nicolas Proske on 06.11.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension ContentView {
    var siteNotFound: some View {
        ContentUnavailableView {
            Text("404")
                .bold()
        } description: {
            Text("Seite nicht gefunden")
        } actions: {
            Button {
                navigationManager.navigate(to: .dashboard)
            } label: {
                Text("Zurück zum Dashboard")
            }
        }
    }
}
