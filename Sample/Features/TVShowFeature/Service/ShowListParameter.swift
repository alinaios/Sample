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
    var routePath: String {
        return "search/shows?q=\(query)"
    }
}
