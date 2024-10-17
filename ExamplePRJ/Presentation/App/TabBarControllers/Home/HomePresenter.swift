//
//  HomePresenter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 13/10/2024.
//

import Foundation
import Combine

protocol OutputHomeRemoteDataManagerProtocol: AnyObject {
    func networkStatus(status: NetworkHomeStatus)
}

protocol HomePresenterProtocol: AnyObject {
    var view: HomeViewControllerProtocol? { get set }
    var repository: InputHomeRemoteDataManagerProtocol?{ get set }
    var router: HomeRouterProtocol?{ get set }

}

final class HomePresenter: HomePresenterProtocol {

    weak var view: HomeViewControllerProtocol?
    var repository: InputHomeRemoteDataManagerProtocol?
    var router: HomeRouterProtocol?


    init(){}


}

extension HomePresenter: OutputHomeRemoteDataManagerProtocol{

    func networkStatus(status: NetworkHomeStatus){
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

enum NetworkHomeStatus {
    case success
    case errors( message: String)
    case noNetwork
}
