//
//  BundleExtensions.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//
import Foundation

class BundleHelper {

  class func bundle() -> Bundle {
      let podBundle = Bundle(for: BundleHelper.self)
      var bundle = Bundle(identifier: Constants.bundleId ?? "") ?? .main
        if let url = podBundle.url(forResource: Constants.bundleId, withExtension: "bundle") {
            bundle = Bundle(url: url) ?? Bundle(identifier: Constants.bundleId ?? "") ?? .main
        }
        return bundle
    }
}
