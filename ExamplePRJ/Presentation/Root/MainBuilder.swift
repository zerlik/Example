//
//  MainBuilder.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

import UIKit

final class MainBuilder {
    
    static func make(_ dependencies: Dependencies) -> MainViewController {
        
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
    
//    static func makeNavigation(_ link: URL?) -> UINavigationController {
//        
//        let cont = self.make(link)
//        let navigationController = UINavigationController(rootViewController: cont)
//        navigationController.modalPresentationStyle = .fullScreen
//        navigationController.isNavigationBarHidden = true
//        navigationController.hidesBottomBarWhenPushed = true
//        
//        return navigationController
//        
//        return MainViewController()
//    }
}

//protocol BuilderProtocol{
//    static func makeNavigation() -> UINavigationController
//    static func make() -> UIViewController
//}
//extension BuilderProtocol{
//    static func makeNavigation() -> UINavigationController {
//        
//        let cont = self.make()
//        let navigationController = UINavigationController(rootViewController: cont)
//        navigationController.modalPresentationStyle = .fullScreen
//        navigationController.isNavigationBarHidden = true
//        navigationController.hidesBottomBarWhenPushed = true
//        
//        return navigationController
//    }
//}
