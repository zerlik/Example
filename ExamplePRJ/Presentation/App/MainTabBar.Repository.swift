//
//  MainTabBarRepository.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//


import Combine

protocol InputMainTabBarRemoteDataManagerProtocol: AnyObject{

}

final class MainTabBarRepository : InputMainTabBarRemoteDataManagerProtocol{

    private weak var output: OutputMainTabBarRemoteDataManagerProtocol?
    private let service: NetworkProvider
    var cancellables = Set<AnyCancellable>()

    init(_ output: OutputMainTabBarRemoteDataManagerProtocol?, service: NetworkProvider){
        self.output = output
        self.service = service
    }

}

