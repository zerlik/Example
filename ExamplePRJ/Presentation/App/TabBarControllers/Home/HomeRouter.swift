//
//  HomeRouter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 13/10/2024.
//

import UIKit

enum HomeRouterCases: Equatable {

    case dissmiss
    case fullInfo

    static func == (lhs: HomeRouterCases, rhs: HomeRouterCases) -> Bool {
        return true
    }
}

protocol HomeRouterProtocol: AnyObject {
    func navigate(to route: HomeRouterCases)
}

final class HomeRouter: HomeRouterProtocol {

    private weak var view: UIViewController?

    init(view: UIViewController) {
        self.view = view
    }

    func navigate(to route: HomeRouterCases) {
        switch route {
        case .fullInfo: _ = 1
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


