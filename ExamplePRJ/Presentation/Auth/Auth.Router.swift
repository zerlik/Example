//
//  AuthRouterCases.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//
import UIKit

enum AuthRouterCases: Equatable {
    
    case dissmiss
    case onboarding
    
    static func == (lhs: AuthRouterCases, rhs: AuthRouterCases) -> Bool {
        return true
    }
}

protocol AuthRouterProtocol: AnyObject {
    func navigate(to route: AuthRouterCases)
}

final class AuthRouter: AuthRouterProtocol {
    
    private weak var view: UIViewController?
    private var dependencies: Dependencies

    init(view: UIViewController, dependencies: Dependencies) {
        self.view = view
        self.dependencies = dependencies
    }

    func navigate(to route: AuthRouterCases) {
        switch route {
        case .onboarding: _ = 1
            // MARK: Next controllers
            //            let vc = BuilderOnboarding.make()
            //            self.view?.navigationController?.pushViewController(vc, animated: true)
            
        case .dissmiss:
            dissmisVC()
        }
    }
    
    private func dissmisVC(){
        guard view?.navigationController?.popViewController(animated: true) != nil else {
            view?.dismiss(animated: true, completion: nil)
            return
        }
    }
}
