//
//  DataFetchManager.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import Combine

class DataFetchManager {

    let manager: URLSessionManager

    init(with sessionManager: URLSessionManager) {
        manager = sessionManager
    }

    func execute<T: Decodable, R: Routing, E: Error>(_ route: R, errorType: E.Type) -> AnyPublisher<T, Error> {
        return manager.fetch(route)
    }
}
