//
//  MainTabBarBuilder.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit

final class MainTabBarBuilder {

    static func make(_ dependencies: Dependencies) -> MainTabBarViewController {

        let presenter: OutputMainTabBarRemoteDataManagerProtocol & MainTabBarPresenterProtocol = MainTabBarPresenter()
        let repo: InputMainTabBarRemoteDataManagerProtocol = MainTabBarRepository(presenter, service: dependencies.service)

        let controller = MainTabBarViewController(presenter: presenter)
        presenter.view = controller as MainTabBarViewControllerProtocol
        presenter.repository = repo

        let router: MainTabBarRouterProtocol = MainTabBarRouter(view: controller, dependencies: dependencies)
        presenter.router = router

        controller.modalPresentationStyle = .fullScreen

        return controller
    }
}
