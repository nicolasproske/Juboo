//
//  LoginView+Functions.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension LoginView {
    func generateMockData() {
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

    func login() {
        if let randomMember = members.first(where: { $0.username == MockData.username }) {
            memberManager.loginMember(member: randomMember)
            navigationManager.navigate(to: .main)
        } else {
            print("No member found in context")
        }
    }
}
