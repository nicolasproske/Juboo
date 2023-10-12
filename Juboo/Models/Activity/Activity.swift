//
//  Activity.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

class Activity: Identifiable {
    let id = UUID()

    var title: String
    var takesPlaceOn: Date
    var imageName: String?

    init(
        title: String,
        takesPlaceOn: Date = .now,
        imageName: String? = nil
    ) {
        self.title = title
        self.takesPlaceOn = takesPlaceOn
        self.imageName = imageName
    }
}
