//
//  URLExtension.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation

extension URL {
    
    static var baseURLComponent: URLComponents {
//#if DEBUG
        let env = SettingsAppBundleHelper.shared.currentEnvironment.baseUrl
        var component = URLComponents(string: env)!
        
        if let comp = URLComponents(string: env){
            component = comp
        }
//#else
//        let env = Env.production.baseUrl
//        component.host = env
//#endif
        return component
    }
}

enum Env: String {
    case production
    case stage
    case development
    
    var baseUrl: String {
        switch self {
//        case .development:
//            return "http://"
//
//        case .production:
//            return "http://"
//
        default:
            return Constants.apiEndPoint
        }
    }
}

final class SettingsAppBundleHelper {
    static let shared = SettingsAppBundleHelper()
    private init() {}
    
    var currentEnvironment: Env {
        return Env.stage
    }
}
