//
//  MemberManager.swift
//  Juboo
//
//  Created by Nicolas Proske on 16.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

@Observable
final class MemberManager {
    /// The current member who is logged in. This property is read-only from outside the class.
    private(set) var currentMember: Member?
}

extension MemberManager {
    /// Logs in a member and sets them as the current member.
    /// - Parameter member: The `Member` instance to set as the current member.
    func loginMember(member: Member) {
        currentMember = member
    }
}
