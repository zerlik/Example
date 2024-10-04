//
//  AuthRouterCases.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//
import UIKit

enum AuthRouterCases: Equatable {
    
    case Dissmiss
    case Onboarding
    
    static func == (lhs: AuthRouterCases, rhs: AuthRouterCases) -> Bool {
        return true
    }
}

protocol AuthRouterProtocol: AnyObject {
    func navigate(to route: AuthRouterCases)
}

final class AuthRouter: AuthRouterProtocol {
    
    private weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func navigate(to route: AuthRouterCases) {
        switch route {
        case .Onboarding: _ = 1
            // MARK: Next controllers
            //            let vc = BuilderOnboarding.make()
            //            self.view?.navigationController?.pushViewController(vc, animated: true)
            
        case .Dissmiss:
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
