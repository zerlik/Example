//
//  RetryOn.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Combine

//extension Publisher {
//    
//    func retryOn<E: Error & Equatable>(_ error:E, retries: UInt, chainedPublisher:AnyPublisher<Output, Failure>? = nil) -> Publishers.RetryOn<Self, E> {
//        return .init(upstream: self,
//                     retries: retries,
//                     error: error,
//                     chainedPublisher: chainedPublisher)
//    }
//}


extension Publishers {
    struct RetryOn<Upstream: Publisher, ErrorType: Error & Equatable>: Publisher {
        
        typealias Output = Upstream.Output
        
        typealias Failure = Upstream.Failure
        
        let upstream: Upstream
        let retries: UInt
        let error:ErrorType
        let chainedPublisher:AnyPublisher<Output, Failure>?
        
    
        init(upstream: Upstream, retries: UInt, error:ErrorType, chainedPublisher:AnyPublisher<Output, Failure>?) {
            self.upstream = upstream
            self.retries = retries
            self.error = error
            self.chainedPublisher = chainedPublisher
        }
        
        func receive<S: Subscriber>(subscriber: S) where Upstream.Failure == S.Failure, Upstream.Output == S.Input {
            self.upstream
                .catch { e -> AnyPublisher<Output, Failure> in
                    guard (e as? ErrorType) == self.error,
                          self.retries > 0 else {
                        return Fail<Output, Failure>(error: e).eraseToAnyPublisher()
                    }
                    if let chainedPublisher = self.chainedPublisher {
                        return chainedPublisher.flatMap { value -> AnyPublisher<Output, Failure> in
                            self.upstream.retryOn(self.error, retries:self.retries - 1).eraseToAnyPublisher()
                        }.eraseToAnyPublisher()
                    }
                    return self.upstream.retryOn(self.error, retries:self.retries - 1).eraseToAnyPublisher()
                }
                .subscribe(subscriber)
        }
    }
}
