//
//  MainTabBarRouter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit

enum MainTabBarRouterCases: Equatable {

    case createTabBarControllers
    case dissmiss

    static func == (lhs: MainTabBarRouterCases, rhs: MainTabBarRouterCases) -> Bool {
        return true
    }
}

protocol MainTabBarRouterProtocol: AnyObject {
    func navigate(to route: MainTabBarRouterCases)
}

final class MainTabBarRouter: MainTabBarRouterProtocol {

    private weak var view: UIViewController?
    private var dependencies: Dependencies

    init(view: UIViewController, dependencies: Dependencies) {
        self.view = view
        self.dependencies = dependencies
    }

    func navigate(to route: MainTabBarRouterCases) {
        
        switch route {
        case .createTabBarControllers:
            let firstViewController = EventsListBuilder.makeNavigation(dependencies)
            let secondViewController = UIViewController()//BuilderList.makeNavigation()
            let thirdViewController = UIViewController()//BuilderAdd.makeNavigation()
            let fothViewController = EventsListBuilder.makeNavigation(dependencies)

            if let vc = self.view as? MainTabBarViewController {
                vc.viewControllers = [firstViewController, secondViewController, thirdViewController, fothViewController]
            }
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
