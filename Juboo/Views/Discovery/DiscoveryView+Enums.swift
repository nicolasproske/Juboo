//
//  DiscoveryView+Enums.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

extension DiscoveryView {
    enum FilterItem: String, Identifiable, CaseIterable {
        var id: String {
            rawValue
        }

        case all, new, soon, friends

        var title: String {
            switch self {
            case .all:
                return "Alle"
            case .new:
                return "Neu"
            case .soon:
                return "Bald"
            case .friends:
                return "Freunde"
            }
        }
    }
}
