//
//  NetworkProvider.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

final class NetworkProvider {
    
    func makeAuthNetwork() -> ApiClientAuthProtocols {
        let network = NetworkFetcher()
        return ApiClientAuth(network: network)
    }
}
