//
//  EventsListViewController.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import UIKit

protocol EventsListViewControllerProtocol: AnyObject {

}

final class EventsListViewController: NibViewController {

    private var presenter: EventsListPresenterProtocol?

    init(presenter: EventsListPresenterProtocol?) {
        self.presenter = presenter
        super.init()
    }

    override func loadView() {
        view = EventsListRootView(presenter)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

extension EventsListViewController: EventsListViewControllerProtocol {

}


