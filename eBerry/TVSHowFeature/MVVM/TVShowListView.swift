//
//  TVShowListView.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import SwiftUI

struct TVShowListView: View {
    @ObservedObject var viewModel = TVShowListViewModel(service: tvShowService)
    @State private var isShowingDetailView = false

    var body: some View {
        content.onAppear {
            viewModel.send(event: .onAppear)
        }.ignoresSafeArea(.container, edges: [.bottom])
    }

    private var content: some View {
        switch viewModel.state {
        case .loadingList:
            return Spinner(isAnimating: true, style: .large).eraseToAnyView()
        case .loadedList(let list):
            return loadedList(list: list).eraseToAnyView()
        case .error(let error):
            return EmptyContentText(title: error.localizedDescription,
                                    buttonTitle: "Retry").eraseToAnyView()
        case .empty:
            return Spinner(isAnimating: true, style: .large).eraseToAnyView()
        }
    }

    private func loadedList(list: [TVShowElement]) -> some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .leading, spacing: ProjectLayout.indent32, content: {
                    Spacer()
                    ForEach(list) { currentItem in
                        elementView(show: currentItem)
                    }
                })
            }.navigationTitle("TV Shows for girls")
        }
    }

    private func elementView(show: TVShowElement) -> some View {
        NavigationLink(destination: ShowView(show: show)) {
            HStack(spacing: ProjectLayout.indent32, content: {
                AsyncImage(url: URL(string: show.show.image.medium))
                Text(show.show.name)
            })
        }
    }
}
