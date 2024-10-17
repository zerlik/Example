//
//  NetworkProvider.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 28/09/2024.
//

final class NetworkProvider {

    //REST API
    func makeAuthNetwork() -> ApiClientAuthProtocols {
        let network = NetworkFetcher()
        return ApiClientAuth(network: network)
    }

    //GRPC API
    func makeUserGRPCNetwork() -> UserService {
        let network = DefaultGRPCService()
        return network.userServiceClient()
    }
}
