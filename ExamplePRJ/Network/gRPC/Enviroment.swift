//
//  Environment.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 11/10/2024.
//

import Foundation

public protocol EnvironmentProtocol {
    var host: String { get }
    var port: Int { get }
    var apiVersion: String { get }
}

private let environmentKey = "environment_key"

struct Environment {
    static private(set) var current: Environment {
        get {
            let value = UserDefaults.standard.string(forKey: environmentKey) ?? ""
            return Environment(rawValue: value) ?? (EnvironmentConfig.isDebug ? .stage : .production)
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: environmentKey)
            UserDefaults.standard.synchronize()
        }
    }

    static func setEnvironment(_ environment: Environment) {
        current = environment
    }
}

extension Environment {
    enum Environment: String {
        case production
        case stage
    }
}

extension Environment.Environment: EnvironmentProtocol {

    var host: String {
        switch self {
            case .production: return "blabla2.com"
            case .stage: return "blabla2.com"
        }
    }

    var port: Int {
        switch self {
            case .production: return 443
            case .stage: return 443
        }
    }

    var title: String {
        switch self {
        case .production: return "Prod"
        case .stage: return "Stage"
        }
    }

    var apiVersion: String { "/api/v1" }
}

struct EnvironmentConfig {
    static let isTestFlight = Bundle.main.appStoreReceiptURL?.lastPathComponent == ""

    static var isDebug: Bool {
#if DEBUG
        return true
#else
        return false
#endif
    }

    static var isNotProduction: Bool { EnvironmentConfig.isTestFlight || EnvironmentConfig.isDebug }
}
