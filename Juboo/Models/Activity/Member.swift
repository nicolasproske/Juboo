//
//  Member.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

class Member: Identifiable, Equatable {
    static func == (lhs: Member, rhs: Member) -> Bool {
        lhs.username == rhs.username
    }

    let id = UUID()

    var username: String
    var imageName: String?

    init(
        username: String,
        imageName: String? = nil
    ) {
        self.username = username
        self.imageName = imageName
    }
}
