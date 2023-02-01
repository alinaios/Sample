//
//  DataFetchManager.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import Combine

protocol URLSessionManagerProtocol {
    func fetch<T: Decodable, R: Routing>(_ routing: R) -> AnyPublisher<T, Error>
}

class DataFetchManager {

    let manager: URLSessionManagerProtocol

    init(with sessionManager: URLSessionManagerProtocol) {
        manager = sessionManager
    }

    func execute<T: Decodable, R: Routing, E: Error>(_ route: R, errorType: E.Type) -> AnyPublisher<T, Error> {
        return manager.fetch(route)
    }
}
