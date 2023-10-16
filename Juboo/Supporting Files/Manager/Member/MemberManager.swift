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
    private(set) var currentMember: Member?
}

extension MemberManager {
    func loginMember(member: Member) {
        currentMember = member
    }
}
