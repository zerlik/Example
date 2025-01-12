//
//  MainBuilder.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import UIKit

final class MainBuilder: Builders {

    func makeVC(_ dependencies: Dependencies) -> UIViewController {

        let presenter: OutputMainRemoteDataManagerProtocol & MainPresenterProtocol = MainPresenter()
        let repo: InputMainRemoteDataManagerProtocol = MainRepository(presenter, service: dependencies.service)
        
        let controller = MainViewController(presenter: presenter)
        presenter.view = controller as MainViewControllerProtocol
        presenter.repository = repo

        let router: MainRouterProtocol = MainRouter(view: controller, dependencies: dependencies)
        presenter.router = router
        
        controller.modalPresentationStyle = .fullScreen
        
        return controller
    }
}

protocol Builders{
    func makeVC(_ dependencies: Dependencies) -> UIViewController
    func makeNavigation(_ dependencies: Dependencies) -> UINavigationController
}

extension Builders {

    func makeNavigation(_ dependencies: Dependencies) -> UINavigationController {

        let cont = makeVC(dependencies)
        let navigationController = UINavigationController(rootViewController: cont)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = true
        navigationController.hidesBottomBarWhenPushed = true

        return navigationController
    }
}
