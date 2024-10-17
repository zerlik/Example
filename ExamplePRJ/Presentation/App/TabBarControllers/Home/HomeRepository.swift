//
//  HomeRepository.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 13/10/2024.
//

import Combine

protocol InputHomeRemoteDataManagerProtocol: AnyObject{

}

final class HomeRepository : InputHomeRemoteDataManagerProtocol{

    private weak var output: OutputHomeRemoteDataManagerProtocol?
    private let service: NetworkProvider
    var cancellables = Set<AnyCancellable>()

    init(_ output: OutputHomeRemoteDataManagerProtocol?, service: NetworkProvider){
        self.output = output
        self.service = service
    }

}

