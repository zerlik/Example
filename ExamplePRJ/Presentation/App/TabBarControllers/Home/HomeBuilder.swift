//
//  HomeBuilder.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 13/10/2024.
//

import UIKit

final class HomeBuilder: Builders {

    func makeVC(_ dependencies: Dependencies) -> UIViewController {

        let presenter: OutputHomeRemoteDataManagerProtocol & HomePresenterProtocol = HomePresenter()
        let repo: InputHomeRemoteDataManagerProtocol = HomeRepository(presenter, service: dependencies.service)

        let controller = HomeViewController(presenter: presenter)
        presenter.view = controller as HomeViewControllerProtocol
        presenter.repository = repo

        let router: HomeRouterProtocol = HomeRouter(view: controller)
        presenter.router = router

        controller.modalPresentationStyle = .fullScreen

        return controller
    }
}

