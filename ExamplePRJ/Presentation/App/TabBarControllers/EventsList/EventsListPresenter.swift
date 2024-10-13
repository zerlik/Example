//
//  EventsListPresenter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import Foundation
import Combine

protocol OutputEventsListRemoteDataManagerProtocol: AnyObject {
    func networkStatus(status: NetworkEventsListStatus)
}

protocol EventsListPresenterProtocol: AnyObject {
    var view: EventsListViewControllerProtocol? { get set }
    var repository: InputEventsListRemoteDataManagerProtocol?{ get set }
    var router: EventsListRouterProtocol?{ get set }

}

final class EventsListPresenter: EventsListPresenterProtocol {

    weak var view: EventsListViewControllerProtocol?
    var repository: InputEventsListRemoteDataManagerProtocol?
    var router: EventsListRouterProtocol?


    init(){}


}

extension EventsListPresenter: OutputEventsListRemoteDataManagerProtocol{

    func networkStatus(status: NetworkEventsListStatus){
        DispatchQueue.main.async {
//            self.stopLoader.send()
        }

        switch status {
        case .success:
            _ = 1
        case .errors(let message):
            print("ERROR--- \(message)")
        case .noNetwork:
            print("ERROR--- NO Inet")
        }
    }
}

enum NetworkEventsListStatus {
    case success
    case errors( message: String)
    case noNetwork
}
