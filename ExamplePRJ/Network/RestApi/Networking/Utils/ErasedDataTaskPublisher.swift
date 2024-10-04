//
//  ErasedDataTaskPublisher.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation
import Foundation
import Combine

extension URLSession.ErasedDataTaskPublisher {
    
    func retryOnceOnUnauthorizedResponse(chainedRequest:AnyPublisher<Output, Error>? = nil) -> AnyPublisher<Output, Error> {
        tryMap { data, response -> URLSession.ErasedDataTaskPublisher.Output in
            if let res = response as? HTTPURLResponse,
               res.statusCode == 401 {
                throw ApplicationError(statusCode: 401, nativeErrorDescription: "")
            } else if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any],
                      let errors = json["errors"] as? [[String:Any]] {
                if (errors.contains(where: { ($0["extensions"] as? [String:Any])?["code"] as? String == "not-authorized" })) {
                    throw ApplicationError(statusCode: 401, nativeErrorDescription: "")
                }
            } else if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any],
                      let errors = json["message"] as? [[String:Any]] {
                if (errors.contains(where: { ($0["extensions"] as? [String:Any])?["code"] as? String == "not-authorized" })) {
                    throw ApplicationError(statusCode: 401, nativeErrorDescription: "")
                }
            }
            return (data:data, response:response)
        }
//        .retryOn(ApplicationError(statusCode: 401, nativeErrorDescription: ""), retries: 1, chainedPublisher: chainedRequest)
        .eraseToAnyPublisher()
    }
}

extension URLSession {
    typealias ErasedDataTaskPublisher = AnyPublisher<(data: Data, response: URLResponse), Error>
    
    func erasedDataTaskPublisher(for request: URLRequest) -> ErasedDataTaskPublisher {
        dataTaskPublisher(for: request)
            .mapError { $0 }
            .eraseToAnyPublisher()
    }
}

