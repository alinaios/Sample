//
//  MockURLSessionManager.swift
//  eBerryTests
//
//  Created by A H on 2023-02-01.
//

import Foundation
import Combine
@testable import eBerry

final class MockURLSessionManager: URLSessionManagerProtocol {

    var request: URLRequest?

    init(urlRequest: URLRequest) {
        request = urlRequest
    }

    func fetch<T: Decodable, R: Routing>(_ routing: R) -> AnyPublisher<T, Error> {
        let urlSession = URLSession(configuration: .default)
#if DEBUG
        print(routing.urlRequest ?? "urlRequest is nil")
#endif
        guard let url = routing.urlRequest else {
            fatalError("Could not create url")
        }

        return urlSession.dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
