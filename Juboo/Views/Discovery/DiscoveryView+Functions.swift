//
//  DiscoveryView+Functions.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

extension DiscoveryView {
    /// Filters an activity based on the currently selected filter criteria.
    /// - Parameter activity: The `Activity` to be filtered.
    /// - Returns: A `Bool` indicating whether the activity passes the filter.
    func filterActivity(_ activity: Activity) -> Bool {
        switch selectedFilterItem {
        case .all:
            // All activities pass this filter.
            return true
        case .new:
            // Filter for activities that are new.
            return activity.isNew
        case .friends:
            // Filter for activities that have members.
            return !activity.members.isEmpty
        case .soon:
            // Filter for activities happening soon.
            return activity.isSoon
        }
    }
}
