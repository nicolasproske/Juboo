//
//  LoginView+Functions.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import SwiftUI

extension LoginView {
    func login() {
        if let randomMember = members.randomElement() {
            memberManager.loginMember(member: randomMember)
            navigationManager.navigate(to: .main)
        } else {
            print("No member found in context")
        }
    }
}
