//
//  DiscoveryView+Enums.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

extension DiscoveryView {
    /// An enumeration defining filter options for activities with localized titles.
    enum FilterItem: String, Identifiable, CaseIterable {
        /// The identifier for each filter item, derived from its raw value.
        var id: String {
            rawValue
        }

        case all, new, soon, friends

        /// The title of the filter item, localized in German.
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
