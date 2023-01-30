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
    @State private var query: String = "boys"

    var body: some View {
        content.onAppear {
            viewModel.send(event: .onAppear(query))
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
            return emptyResults().eraseToAnyView()
        }
    }

    private func loadedList(list: [TVShowElement]) -> some View {
        return NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: ProjectLayout.indent32, content: {
                    searchHeader(query: $query)
                    ForEach(list) { currentItem in
                        elementView(show: currentItem)
                    }
                }).padding()
            }.navigationTitle("TV Shows for \(query)")
        }
    }

    private func elementView(show: TVShowElement) -> some View {
        NavigationLink(destination: ShowView(viewModel: ShowViewViewModel(show: show))) {
            HStack(spacing: ProjectLayout.indent32, content: {
                AsyncImage(url: URL(string: show.show.image?.medium ?? ""))
                Text(show.show.name ?? "no name")
            })
        }
    }

    private func searchHeader(query: Binding<String>) -> some View {
        VStack(alignment: .leading, spacing: ProjectLayout.indent24, content: {
            SearchView(text: query, searchButtonHandler: {
                viewModel.send(event: .onAppear(query.wrappedValue))
            })
        })
    }

    private func emptyResults() -> some View {
        return NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: ProjectLayout.indent24, content: {
                    searchHeader(query: $query)
                    EmptyContentText(title: "no results")
                    Spacer()
                }).padding()
            }.navigationTitle("TV Shows for \(query)")
        }
    }
}
