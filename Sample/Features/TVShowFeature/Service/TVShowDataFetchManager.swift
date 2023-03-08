//
//  DataService.swift
//  Sample
//
//  Created by A H on 2023-01-27.
//

import Foundation
import Combine

final class TVShowDataFetchManager: DataFetchManager {
    func fetch(with parameters: ShowListParameter) -> AnyPublisher<[ShowElement], Error> {
        return execute(parameters, errorType: Error.self)
    }
}
