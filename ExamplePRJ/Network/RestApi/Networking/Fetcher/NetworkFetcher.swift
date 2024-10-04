//
//  NetworkFetcher.swift
//  ExamplePRJ
//
//  Created by Andrei Ziamlianski on 04/10/2024.
//

import Foundation
import Combine

struct NetworkFetcher {
    
    let retries: UInt = 3
    
    func run<T: Decodable>(_ request: URLRequest, chainedRequest: AnyPublisher<URLSession.ErasedDataTaskPublisher.Output, Error>? = nil, _ decoder: JSONDecoder = JSONDecoder()) -> AnyPublisher<T, ApplicationError> {
        
        decoder.keyDecodingStrategy  = .convertFromSnakeCase
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap{ data, response -> URLSession.ErasedDataTaskPublisher.Output in
                
                if let response = response as? HTTPURLResponse, response.statusCode == 401 { //   401 Invalid access token - go on refreshToken
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any]
                    let errMess = json?["message"] as? String
                    throw ApplicationError(statusCode: 401, nativeErrorDescription: errMess ?? "")
                }
                
                if let response = response as? HTTPURLResponse,
                   !(200...299).contains(response.statusCode) {
                    if let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String:Any], let errMess = json["message"] as? String {
                        let statusCode = response.statusCode
                        throw ApplicationError(statusCode: statusCode, nativeErrorDescription: errMess)
                    }
                    
                    let statusCode = response.statusCode
                    let error = NSError(domain: "", code: response.statusCode, userInfo: [:])
                    throw ApplicationError(statusCode: statusCode, nativeErrorDescription: error.debugDescription)
                }
                
                if let response = response as? HTTPURLResponse, response.statusCode == 204 || response.statusCode == 201 || response.statusCode == 200{
                    if data.count == 0 {
                        let emptyData = try JSONSerialization.data(withJSONObject: true, options: .fragmentsAllowed)
                        return (data:emptyData, response:response)
                    }
                }
                
                return (data:data, response:response)
            }
//            .retryOn(ApplicationError(statusCode: 401, nativeErrorDescription: ""), retries: retries, chainedPublisher: chainedRequest)
            .tryMap { output in
                return output.data
            }
            .decode(type: T.self, decoder: decoder)
            .mapError({ error in
                print("-----run--\(error)")
                return error as? ApplicationError ?? ApplicationError(statusCode: 0, nativeErrorDescription: "error cant be mapped")
            })
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct ApplicationError: Error, CustomStringConvertible, Equatable, Decodable {

    var description: String {
        if statusCode == 401 {
            return NSLocalizedString("LoginPassword.Email.AuthError401", comment: "")
        }
        if statusCode == 400 {
            return NSLocalizedString("Error.IncorrectLoginCredentials", comment: "")
        }
        if statusCode == 502 {
            return "Server responds with 502 error"
        }
        return nativeErrorDescription ?? ""
    }
    var statusCode: Int?
    var nativeErrorDescription: String?
    
    //"code": "NUMBER_OF_ATTEMPTS_EXCEEDED",
    //    "message": "Number of attempts exceeded",
    //    "args": [
    //        "+905346819694",
    //        "2023-01-17T13:17:42.31"
    //    ]
    
}
//case success = "Ok"
//    case authenticationError = "You need to be authenticated first."
//    case badRequest = "Bad request"
//    case outdated = "The url you requested is outdated."
//    case failed = "Network request failed."
//    case noData = "Response returned with no data to decode."
//    case unableToDecode = "We could not decode the response."
//    case noNetwork = "No Internet connections."


