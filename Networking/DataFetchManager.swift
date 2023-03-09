//
//  DataFetchManager.swift
//  Sample
//
//  Created by A H on 2023-01-27.
//

import Foundation
import Combine

class DataFetchManager {

    let manager: FetchManagerProtocol

    init(with fetchManager: FetchManagerProtocol) {
        manager = fetchManager
    }

    func execute<T: Decodable, R: Routing, E: Error>(_ route: R, errorType: E.Type) -> AnyPublisher<T, Error> {
        return manager.fetch(route)
    }
}
