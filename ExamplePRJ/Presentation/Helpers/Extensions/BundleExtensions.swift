//
//  BundleExtensions.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//
import Foundation

extension Bundle {
    private static let bundleID = Constants.bundleId
    static var module: Bundle {
        return Bundle(identifier: Constants.bundleId ?? "") ?? .main
    }
}

open class BundleHelper {

    static func bundle() -> Bundle? {
        let podBundle = Bundle(for: BundleHelper.self)
        if let url = podBundle.url(forResource: Constants.app, withExtension: "bundle") {
            return Bundle(url: url)
        }
        return nil
    }
}
