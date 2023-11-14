//
//  LoginView.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftData
import SwiftUI

struct LoginView: View {
    @Environment(NavigationManager.self) var navigationManager
    @Environment(MemberManager.self) var memberManager

    @Environment(\.modelContext) var context

    @Query var activities: [Activity]
    @Query var chats: [Chat]
    @Query var members: [Member]
    @Query var messages: [Message]

    @State var username = ""
    @State var password = ""

    var body: some View {
        HStack(spacing: 0) {
            leadingContent

            Divider()
                .ignoresSafeArea()

            trailingContent
        }
        .onAppear(perform: generateMockData)
    }
}

#Preview {
    LoginView()
}
