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

    @Environment(\.modelContext) private var context

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

    private func generateMockData() {
        do {
            try context.delete(model: Activity.self)
            try context.delete(model: Chat.self)
            try context.delete(model: Member.self)
            try context.delete(model: Message.self)
        } catch {
            print("Failed to clear all context data.")
        }

        if activities.isEmpty {
            for activity in MockData.getActivities() {
                context.insert(activity)
            }
        }

        if chats.isEmpty {
            for chat in MockData.getChats() {
                context.insert(chat)
            }
        }

        if members.isEmpty {
            for member in MockData.getMembers() {
                context.insert(member)
            }
        }
    }
}

#Preview {
    LoginView()
}
