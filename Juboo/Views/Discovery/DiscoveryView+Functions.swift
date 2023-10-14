//
//  DiscoveryView+Functions.swift
//  Juboo
//
//  Created by Nicolas Proske on 14.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

extension DiscoveryView {
    func filterActivity(_ activity: Activity) -> Bool {
        switch selectedFilterItem {
        case .all:
            return true
        case .new:
            return activity.isNew
        case .friends:
            return !activity.members.isEmpty
        case .soon:
            return activity.isSoon
        }
    }
}
