//
//  TVShowListModel.swift
//  eBerry
//
//  Created by A H on 2023-01-27.
//

import Foundation
import Combine

final class TVShowListViewModel: ObservableObject {
    @Published private(set) var state = State.loadingList
    private var bag = Set<AnyCancellable>()
    private let input = PassthroughSubject<Event, Never>()
    private var service: DataService
    init(service: DataService) {
        self.service = service
    }

    private func fetch(service: DataService) {
        Publishers.system(
            initial: state,
            reduce: Self.reduce,
            scheduler: RunLoop.main,
            feedbacks: [
                Self.whenLoading(service: service),
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
        case .onAppear:
            fetch(service: self.service)
        default:
            break
        }
    }
}
extension TVShowListViewModel {
    // System states
    enum State {
        case loadingList
        case loadedList([TVShowElement])
        case error(Error)
        case empty
    }

    // UI events
    enum Event {
        case onAppear
        case onDataLoaded([TVShowElement])
        case onFailedToLoadData(Error)
    }
}
extension TVShowListViewModel {
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

    static func whenLoading(service: DataService) -> Feedback<State, Event> {
        Feedback {(state: State) -> AnyPublisher<Event, Never> in
            switch state {
            case .loadingList:
                return service
                    .fetch(with: TVShowListParameter())
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
