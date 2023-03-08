//
//  ShowListViewModelTests.swift
//  SampleTests
//
//  Created by A H on 2023-02-01.
//

@testable import Sample
import Combine
import XCTest

final class ShowListViewModelTests: XCTestCase {
    var service: ShowDataService!
    var viewModel: ShowListViewModel!
    private var bag = Set<AnyCancellable>()

    func testEmptyShowList() throws {

        let request = URLRequest(url: Bundle.main.url(forResource: "fullResponse", withExtension: "json")!)

        service = ShowDataService(with: MockURLSessionManager(urlRequest: request))

        // Initilize view model
        viewModel = ShowListViewModel(service: service)
        viewModel.send(event: ShowListViewModel.Event.onAppear("girlaaaas"))

        let statePublisher = viewModel.$state
            .collect(2)
            .first()

        let stateArrays = try awaitPublisher(statePublisher)
        let state = stateArrays.last
        XCTAssertEqual(stateArrays.count, 2)

        switch state {
        case .empty:
            XCTAssertTrue(true)
        default:
            // Fail if state differs
            XCTFail("Expected to be empty, but was \(String(describing: state))")
        }
    }

    func testFullShowList() throws {
        let request = URLRequest(url: Bundle.main.url(forResource: "fullResponse", withExtension: "json")!)

        service = ShowDataService(with: MockURLSessionManager(urlRequest: request))

        // Initilize view model
        viewModel = ShowListViewModel(service: service)
        viewModel.send(event: ShowListViewModel.Event.onAppear("girls"))

        let statePublisher = viewModel.$state
            .collect(2)
            .first()

        let stateArrays = try awaitPublisher(statePublisher)
        let state = stateArrays.last
        XCTAssertEqual(stateArrays.count, 2)

        switch state {
        case .loadedList(let list):
            XCTAssertTrue(list.count > 0)
        default:
            // Fail if state differs
            XCTFail("Expected to be empty, but was \(String(describing: state))")
        }
    }
}
