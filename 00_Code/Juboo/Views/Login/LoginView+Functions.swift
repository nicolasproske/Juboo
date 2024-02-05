//
//  LoginView+Functions.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension LoginView {
    /// Generates mock data by deleting existing data and inserting new mock data for `Activity`, `Chat`, `Member`, and `Message` models.
    func generateMockData() {
        do {
            // Delete existing data for the specified models.
            try context.delete(model: Activity.self)
            try context.delete(model: Chat.self)
            try context.delete(model: Member.self)
            try context.delete(model: Message.self)
        } catch {
            // Handle failure to clear all context data.
            print("Failed to clear all context data.")
        }

        // Insert mock activities if the activities list is empty.
        if activities.isEmpty {
            for activity in MockData.getActivities() {
                context.insert(activity)
            }
        }

        // Insert mock chats if the chats list is empty.
        if chats.isEmpty {
            for chat in MockData.getChats() {
                context.insert(chat)
            }
        }

        // Insert mock members if the members list is empty.
        if members.isEmpty {
            for member in MockData.getMembers() {
                context.insert(member)
            }
        }
    }

    /// Attempts to log in using a mock username. If successful, navigates to the main view.
    func login() {
        // Attempt to find a member with the mock username.
        if let randomMember = members.first(where: { $0.username == MockData.username }) {
            // Log in the found member and navigate to the main view.
            memberManager.loginMember(member: randomMember)
            navigationManager.navigate(to: .main)
        } else {
            // Handle no member found with the mock username.
            print("No member found in context")
        }
    }
}
