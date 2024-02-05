//
//  Constants.swift
//  Juboo
//
//  Created by Nicolas Proske on 12.10.23.
//  Copyright © 2023 Nicolas Proske. All rights reserved.
//

import Foundation

class Constants {
    /// The name of the application, fetched from the bundle's info dictionary or a default value if not found.
    static let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String ?? "Juboo"

    /// The version of the application, fetched from the bundle's info dictionary or an empty string if not found.
    static let appVersion: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""

    /// The build number of the application, fetched from the bundle's info dictionary or an empty string if not found.
    static let appBuild: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
}
