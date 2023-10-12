//
//  LoginView.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Environment(NavigationManager.self) var navigationManager
    
    @State var username = ""
    @State var password = ""

    var body: some View {
        HStack(spacing: 0) {
            leadingContent

            Divider()
                .ignoresSafeArea()

            trailingContent
        }
        .onAppear(perform: login)
    }
}

#Preview {
    LoginView()
}
