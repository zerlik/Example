//
//  EventsListBuilder.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit

final class EventsListBuilder {

    static func make(_ dependencies: Dependencies) -> EventsListViewController {

        let presenter: OutputEventsListRemoteDataManagerProtocol & EventsListPresenterProtocol = EventsListPresenter()
        let repo: InputEventsListRemoteDataManagerProtocol = EventsListRepository(presenter, service: dependencies.service)

        let controller = EventsListViewController(presenter: presenter)
        presenter.view = controller as EventsListViewControllerProtocol
        presenter.repository = repo

        let router: EventsListRouterProtocol = EventsListRouter(view: controller)
        presenter.router = router

        controller.modalPresentationStyle = .fullScreen

        return controller
    }

    static func makeNavigation(_ dependencies: Dependencies) -> UINavigationController {

        let cont = self.make(dependencies)
        let navigationController = UINavigationController(rootViewController: cont)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.isNavigationBarHidden = true
        navigationController.hidesBottomBarWhenPushed = true

        return navigationController
    }
}

