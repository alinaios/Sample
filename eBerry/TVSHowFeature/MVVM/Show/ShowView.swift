//
//  ShowView.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import SwiftUI

struct ShowView: View {
    @State var viewModel: ShowViewViewModel

    var body: some View {
        VStack(alignment: .center, spacing: ProjectLayout.indent24, content: {
            Text(viewModel.name)
            Text(viewModel.type)
            Text(viewModel.language)
            if let destinationUrl = viewModel.url {
                Link("Link", destination: destinationUrl)
            }
            if let imageUrl = viewModel.imageUrl {
                AsyncImage(url: imageUrl)
            }
        })
    }
}
