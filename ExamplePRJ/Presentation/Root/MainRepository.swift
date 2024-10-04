//
//  MainRepository.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//
import Foundation
import Combine

protocol InputMainRemoteDataManagerProtocol: AnyObject{
    var output: OutputMainRemoteDataManagerProtocol?{ get set }
   
}

final class MainRepository : InputMainRemoteDataManagerProtocol{
    weak var output: OutputMainRemoteDataManagerProtocol?
    private let service: NetworkProvider
    var cancellables = Set<AnyCancellable>()
    
    init(_ output: OutputMainRemoteDataManagerProtocol?, service: NetworkProvider){
        self.output = output
        self.service = service
    }

}

