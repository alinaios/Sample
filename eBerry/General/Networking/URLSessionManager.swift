//
//  URLSessionManager.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import Combine

final class URLSessionManager {

    init() {}

    func fetch<T: Decodable, R: Routing>(_ routing: R) -> AnyPublisher<T, Error> {
        let urlSession = URLSession(configuration: .default)
#if DEBUG
        print(routing.urlRequest)
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
