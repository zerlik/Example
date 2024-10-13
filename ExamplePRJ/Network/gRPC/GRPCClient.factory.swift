//
//  GRPCClient.factory.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 09/10/2024.
//

import UIKit
import GRPC
import NIOCore
import NIOPosix

final class DefaultGRPCService {

    enum Header: String {
        case contentType = "content-type"
        case authorization = "authorization"
        case languageCode = "language-code"
    }

    private let host: String
    private let port: Int
    private var sharedHeaders: [Header: String] = [:]

    private lazy var eventLoopGroup = PlatformSupport.makeEventLoopGroup(loopCount: 1)

    private lazy var sharedChannel: GRPCChannel = {
        do {
            return try GRPCChannelPool.with(
                target: .host(host, port: port),
                transportSecurity: .tls(
                    GRPCTLSConfiguration.makeClientDefault(compatibleWith: eventLoopGroup)
                ),
                eventLoopGroup: eventLoopGroup
            ) { configuration in
            }
        } catch {
            fatalError("Failed to open GRPC channel")
        }
    }()

    init() {
        self.host = Environment.current.host
        self.port = Environment.current.port

        set(header: .contentType, value: "application/grpc")
        set(header: .languageCode, value: Locale.current.identifier)
    }

    func set(header: Header, value: String?) {
        sharedHeaders[header] = value
    }
}

extension DefaultGRPCService: GRPCService {

    func userServiceClient() -> UserService {
        let client = GrpcExampleServiceAsyncClient(
            channel: sharedChannel,
            defaultCallOptions: .init(
                customMetadata: .init(sharedHeaders.map { ($0.rawValue, $1) }),
                timeLimit: .timeout(.seconds(30))
            )
        )
        return DefaultUserService(
            asyncClient: client
        )
    }
}
