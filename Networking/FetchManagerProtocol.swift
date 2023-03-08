//
//  FetchManagerProtocol.swift
//  Sample
//
//  Created by AH on 2023-03-08.
//

import Combine

protocol FetchManagerProtocol {
    func fetch<T: Decodable, R: Routing>(_ routing: R) -> AnyPublisher<T, Error>
}
