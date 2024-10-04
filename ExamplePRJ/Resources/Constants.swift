//
//  Constants.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Foundation

enum Constants {
    static let app = "ExamplePRJ"
    static let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    static let bundleId = Bundle.main.bundleIdentifier
    static let linkTerms = "https://policies.google.com/terms?hl=en-US"
    static let linkConditions = "https://policies.google.com/terms?hl=en-US"
}
