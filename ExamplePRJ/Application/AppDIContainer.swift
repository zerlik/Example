//
//  AppDIContainer.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

struct Dependencies {
    let service: NetworkProvider
}

final class AppDIContainer {
    
    private let appConfiguration: AppConfiguration
    private let appCustomization: AppCustomization
    
    init() {
        self.appConfiguration = AppConfiguration()
        self.appCustomization = AppCustomization()
    }
}

extension AppDIContainer {
    func makeMainViewController() -> MainViewController {
        let dependencies = Dependencies(service: NetworkProvider())
        return MainBuilder.make(dependencies)
    }
}
