//
//  ShowViewViewModel.swift
//  Sample
//
//  Created by A H on 2023-01-29.
//

import Foundation

struct ShowViewModel {
    let name: String
    let url: URL?
    let imageUrl: URL?
    let type: String
    let language: String

    init(show: ShowElement) {
        // Name of show
        name = show.show.name ?? ""

        // URL
        if let urlString = show.show.url {
            url = URL(string: urlString)
        } else {
            url = nil
        }

        // imageUrl
        if let imageUrlString = show.show.image?.medium {
            imageUrl = URL(string: imageUrlString)
        } else {
            imageUrl = nil
        }

        // Type of show
        switch show.show.type {
        case .none:
            type = ""
        case .some(.value(let value)):
            type = value ?? ""
        }

        // Language of show
        switch show.show.language {
        case .none:
            language = ""
        case .some(.value(let showLanguage)):
            language = showLanguage ?? ""
        }
    }
}
