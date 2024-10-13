//
//  MainTabBarPresenter.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//

import Foundation
import Combine

protocol OutputMainTabBarRemoteDataManagerProtocol: AnyObject {
    func networkStatus(status: NetworkMainTabBarStatus)
}

protocol MainTabBarPresenterProtocol: AnyObject {
    var view: MainTabBarViewControllerProtocol? { get set }
    var repository: InputMainTabBarRemoteDataManagerProtocol?{ get set }
    var router: MainTabBarRouterProtocol?{ get set }
    func didLoad()

}

final class MainTabBarPresenter: MainTabBarPresenterProtocol {

    weak var view: MainTabBarViewControllerProtocol?
    var repository: InputMainTabBarRemoteDataManagerProtocol?
    var router: MainTabBarRouterProtocol?


    init(){}

    func didLoad(){
        DispatchQueue.main.async{
            self.router?.navigate(to: .createTabBarControllers)
        }

    }
}

extension MainTabBarPresenter: OutputMainTabBarRemoteDataManagerProtocol{

    func networkStatus(status: NetworkMainTabBarStatus){
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

enum NetworkMainTabBarStatus {
    case success
    case errors( message: String)
    case noNetwork
}
