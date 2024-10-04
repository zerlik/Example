//
//  AuthRepository.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 29/09/2024.
//

import Foundation
import Combine

protocol InputAuthRemoteDataManagerProtocol: AnyObject{
   
}

final class AuthRepository : InputAuthRemoteDataManagerProtocol{
    private weak var output: OutputAuthRemoteDataManagerProtocol?
    private let service: NetworkProvider
    var cancellables = Set<AnyCancellable>()
    
    init(_ output: OutputAuthRemoteDataManagerProtocol?, service: NetworkProvider){
        self.output = output
        self.service = service
    }

}
