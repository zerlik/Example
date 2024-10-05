//
//  MainRouter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//
import UIKit

enum MainRouterCases: Equatable {
    
    case dissmiss
    case auth
    case signedIn
    
    static func == (lhs: MainRouterCases, rhs: MainRouterCases) -> Bool {
        return true
    }
}

protocol MainRouterProtocol: AnyObject {
    func navigate(to route: MainRouterCases)
}

final class MainRouter: MainRouterProtocol {
    
    private weak var view: UIViewController?
    private var dependencies: Dependencies
    
    init(view: UIViewController, dependencies: Dependencies) {
        self.view = view
        self.dependencies = dependencies
    }
    
    func navigate(to route: MainRouterCases) {
        switch route {
        case .auth:
            let vc = AuthBuilder.make(dependencies: dependencies)
//            self.view?.navigationController?.pushViewController(vc, animated: true)
            self.view?.present(vc, animated: true)
            
        case .signedIn: _ = 1
            //            let vc = BuilderEventsList.make()
            //            self.view.navigationController?.pushViewController(vc, animated: true)
            
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
