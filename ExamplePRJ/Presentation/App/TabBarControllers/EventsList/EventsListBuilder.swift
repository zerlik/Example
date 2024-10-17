//
//  EventsListBuilder.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit

final class EventsListBuilder: Builders {

    func makeVC(_ dependencies: Dependencies) -> UIViewController {

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
}

