//
//  URLSessionManagerTests.swift
//  SampleTests
//
//  Created by A H on 2023-03-09.
//

import Foundation
import XCTest
import Combine
@testable import Sample

class URLSessionManagerTests: XCTestCase {

    func test_init() {
        let request = URLRequest(url: URL(string: "http://any-url.com")!)
        let sessionManager = MockURLSessionManager(urlRequest: request)

        XCTAssertEqual(sessionManager.request, request)
    }

    func test_fetch_correctURL () {
        let request = URLRequest(url: Bundle.main.url(forResource: "fullResponse", withExtension: "json")!)
        let sessionManager = MockURLSessionManager(urlRequest: request)
        let tvShowRouting = ShowListParameter(query: "hello")
        let result: AnyPublisher<[ShowElement], Error> = sessionManager.fetch(tvShowRouting)

        XCTAssertNotNil(result)
    }
}
