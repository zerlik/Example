//
//  EventsListRouter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit

enum EventsListRouterCases: Equatable {

    case dissmiss
    case fullInfo

    static func == (lhs: EventsListRouterCases, rhs: EventsListRouterCases) -> Bool {
        return true
    }
}

protocol EventsListRouterProtocol: AnyObject {
    func navigate(to route: EventsListRouterCases)
}

final class EventsListRouter: EventsListRouterProtocol {

    private weak var view: UIViewController?

    init(view: UIViewController) {
        self.view = view
    }

    func navigate(to route: EventsListRouterCases) {
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

