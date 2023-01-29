//
//  TVShowListParameters.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
struct TVShowListParameter {
    let query: String
}

extension TVShowListParameter: Routing {
    var method: RequestType {
        return .GET
    }

    var routePath: String {
        return "search/shows?q=\(query)"
    }
}
