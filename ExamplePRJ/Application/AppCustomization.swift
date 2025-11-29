//
//  AppCustomization.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import UIKit

final class AppCustomization {
    
    init() {
        
        customizeNavigationBar()
        customizeTabBar()
    }
}

private extension AppCustomization {
    func customizeNavigationBar() {
        let navBarProxy = UINavigationBar.appearance()
        navBarProxy.tintColor = .black
    }
    
    func customizeTabBar() {
        let appearance = UITabBarAppearance()
        appearance.configureWithDefaultBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().tintColor = .clear
    }
}

