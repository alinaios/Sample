//
//  ShowListParameters.swift
//  Sample
//
//  Created by A H on 2023-01-27.
//

import Foundation
struct ShowListParameter {
    let query: String
}

extension ShowListParameter: Routing {
    var method: RequestType {
        return .GET
    }

    var routePath: String {
        return "search/shows?q=\(query)"
    }
}
