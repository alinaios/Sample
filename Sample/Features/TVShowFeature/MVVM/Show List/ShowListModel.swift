//
//  ShowListModel.swift
//  Sample
//
//  Created by A H on 2023-01-27.
//

import Foundation
import Combine

final class ShowListViewModel: ObservableObject {
    @Published private(set) var state = State.loadingList
    private var bag = Set<AnyCancellable>()
    private let input = PassthroughSubject<Event, Never>()
    private var service: TVShowDataFetchManager
    init(service: TVShowDataFetchManager) {
        self.service = service
    }

    private func fetch(service: TVShowDataFetchManager, query: String) {
        Publishers.system(
            initial: state,
            reduce: Self.reduce,
            scheduler: RunLoop.main,
            feedbacks: [
                Self.whenLoading(service: service, query: query),
                Self.userInput(input: input.eraseToAnyPublisher())
            ]
        )
        .assign(to: \.state, on: self)
        .store(in: &bag)
    }

    deinit {
        bag.removeAll()
    }

    func send(event: Event) {
        switch event {
        case .onAppear(let query):
            state = State.loadingList
            fetch(service: self.service, query: query)
        default:
            break
        }
    }
}
extension ShowListViewModel {
    // System states
    enum State {
        case loadingList
        case loadedList([ShowElement])
        case error(Error)
        case empty
    }

    // UI events
    enum Event {
        case onAppear(String)
        case onDataLoaded([ShowElement])
        case onFailedToLoadData(Error)
    }
}
extension ShowListViewModel {
    static func reduce(_ state: State, _ event: Event) -> State {
        switch state {
        case .loadingList:
            switch event {
            case .onAppear:
                return state
            case .onDataLoaded(let list):
                return list.isEmpty ? .empty : .loadedList(list)
            case .onFailedToLoadData(let error):
                return .error(error)
            }
        default:
            return state
        }
    }

    static func whenLoading(service: TVShowDataFetchManager, query: String) -> Feedback<State, Event> {
        Feedback {(state: State) -> AnyPublisher<Event, Never> in
            switch state {
            case .loadingList:
                return service
                    .fetch(with: ShowListParameter(query: query))
                    .map(Event.onDataLoaded)
                    .catch { Just(Event.onFailedToLoadData($0)) }
                    .eraseToAnyPublisher()
            default:
                return Empty().eraseToAnyPublisher()
            }
        }
    }

    static func userInput(input: AnyPublisher<Event, Never>) -> Feedback<State, Event> {
        Feedback { _ in input }
    }
}
