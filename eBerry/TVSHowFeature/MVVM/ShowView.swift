//
//  ShowView.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import SwiftUI

struct ShowView: View {
    @State var show: TVShowElement

    var body: some View {
        VStack(alignment: .center, spacing: ProjectLayout.indent24, content: {
            Text(show.show.name)
            Text(show.show.type.rawValue)
            Text(show.show.language.rawValue)
            Text(show.show.status.rawValue)
            Link("Link", destination: URL(string: show.show.url)!)
            AsyncImage(url: URL(string: show.show.image.medium))
        })
    }
}
