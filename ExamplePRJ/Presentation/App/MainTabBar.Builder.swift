//
//  MainTabBarBuilder.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit

final class MainTabBarBuilder: Builders {

    func makeVC(_ dependencies: Dependencies) -> UIViewController {

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
