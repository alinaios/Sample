//
//  ShowListView.swift
//  Sample
//
//  Created by A H on 2023-01-27.
//

import Foundation
import SwiftUI

struct ShowListView: View {
    @ObservedObject var viewModel: ShowListViewModel
    @State private var isShowingDetailView = false
    @State private var query: String = String(localized: "default placeholder", comment: "search")

    var body: some View {
        content.onAppear {
            viewModel.send(event: .onAppear(query))
        }
    }

    private var content: some View {
        switch viewModel.state {
        case .loadingList:
            return Spinner(isAnimating: true, style: .large).eraseToAnyView()
        case .loadedList(let list):
            return loadedListView(list: list).eraseToAnyView()
        case .error(let error):
            return errorView(error: error).eraseToAnyView()
        case .empty:
            return emptyResultsView().eraseToAnyView()
        }
    }

    private func loadedListView(list: [ShowElement]) -> some View {
        return NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: ProjectLayout.indent32, content: {
                    searchHeader(query: $query)
                    ForEach(list) { currentItem in
                        elementView(show: currentItem)
                    }
                }).padding()
            }.navigationTitle("search").navigationBarTitleDisplayMode(.inline)
        }
    }

    private func elementView(show: ShowElement) -> some View {
        NavigationLink(destination: ShowView(viewModel: ShowViewModel(show: show))) {
            HStack(spacing: ProjectLayout.indent32, content: {
                AsyncImage(url: URL(string: show.show.image?.medium ?? ""))
                Text(show.show.name ?? "")
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

    private func emptyResultsView() -> some View {
        return NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: ProjectLayout.indent24, content: {
                    searchHeader(query: $query)
                    Text(String(localized: "no results \(query)", comment: "inquiry not found"))
                    Spacer()
                }).padding()
            }.navigationTitle("search").navigationBarTitleDisplayMode(.inline)
        }
    }

    private func errorView(error: Error) -> some View {
        return EmptyContentText(title: error.localizedDescription,
                                buttonTitle: String(localized: "retry", comment: "")) {
            viewModel.send(event: .onAppear(query))
        }
    }
}
