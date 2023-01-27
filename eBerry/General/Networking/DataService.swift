//
//  DataService.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import Combine

class DataService: DataFetchManager {
    func fetch(with parameters: TVShowListParameter) -> AnyPublisher<[TVShowElement], Error> {
        return execute(parameters, errorType: Error.self)
    }
}
