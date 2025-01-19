//
//  EventsListRepository.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 05/10/2024.
//
import Combine
import NetworkKIT

protocol InputEventsListRemoteDataManagerProtocol: AnyObject{

}

final class EventsListRepository : InputEventsListRemoteDataManagerProtocol{

    private weak var output: OutputEventsListRemoteDataManagerProtocol?
    private let service: NetworkProvider
    var cancellables = Set<AnyCancellable>()

    init(_ output: OutputEventsListRemoteDataManagerProtocol?, service: NetworkProvider){
        self.output = output
        self.service = service
    }

}
