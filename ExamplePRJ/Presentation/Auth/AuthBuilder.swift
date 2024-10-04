//
//  AuthBuilder.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import UIKit

final class AuthBuilder {
    
    static func make(dependencies: Dependencies) -> AuthViewController {
        
        let presenter: OutputAuthRemoteDataManagerProtocol & AuthPresenterProtocol = AuthPresenter()
        let repo: InputAuthRemoteDataManagerProtocol = AuthRepository(presenter, service: dependencies.service)
        
        let controller = AuthViewController(presenter: presenter)
        presenter.view = controller as AuthViewControllerProtocol
        presenter.repository = repo
        
        let router: AuthRouterProtocol = AuthRouter(view: controller)
        presenter.router = router
        
        controller.modalPresentationStyle = .fullScreen
        
        return controller
    }
}
