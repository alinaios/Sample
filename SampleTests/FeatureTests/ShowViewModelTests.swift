//
//  ShowViewModelTests.swift
//  SampleTests
//
//  Created by AH on 2023-01-29.
//

import XCTest
@testable import Sample

final class ShowStatusViewModelTests: XCTestCase {

    func testMissingImageUrl() throws {
        let viewModel = ShowViewModel(show: mockA)
        XCTAssertNil(viewModel.imageUrl)
    }

    func testExistingImageUrl() throws {
        let viewModel = ShowViewModel(show: mockB)
        XCTAssertNotNil(viewModel.imageUrl)
    }

    func testMissingShowUrl() throws {
        let viewModel = ShowViewModel(show: mockA)
        XCTAssertNil(viewModel.url)
    }

    func testExistingShowUrl() throws {
        let viewModel = ShowViewModel(show: mockB)
        XCTAssertNotNil(viewModel.url)
    }

    func testMissingName() throws {
        let viewModel = ShowViewModel(show: mockA)
        XCTAssertEqual(viewModel.name, "")
    }

    func testExistingName() throws {
        let viewModel = ShowViewModel(show: mockB)
        XCTAssertNotNil(viewModel.name)
    }

    func testMissingType() throws {
        let viewModel = ShowViewModel(show: mockA)
        XCTAssertEqual(viewModel.type, "")
    }

    func testExistingType() throws {
        let viewModel = ShowViewModel(show: mockB)
        XCTAssertEqual(viewModel.type, "animation")
    }

    func testMissingLanguage() throws {
        let viewModel = ShowViewModel(show: mockB)
        XCTAssertEqual(viewModel.language, "")
    }

    func testExistingLanguage() throws {
        let viewModel = ShowViewModel(show: mockA)
        XCTAssertEqual(viewModel.language, "English")
    }
}

let mockA = ShowElement(score: 0.9082468,
                          show: Show(id: 139,
                                     url: nil,
                                     name: nil,
                                     type: .none,
                                     language: .value(name: "English"),
                                     genres: ["Drama", "Romance"],
                                     status: Status.ended,
                                     runtime: 30,
                                     averageRuntime: 30,
                                     premiered: "2012-04-15",
                                     ended: "2017-04-16",
                                     officialSite: "http://www.hbo.com/girls",
                                     schedule: Schedule.init(time: "22:00", days: ["Sunday"]),
                                     rating: Rating.init(average: 6.7),
                                     weight: 97,
                                     network: nil,
                                     webChannel: nil,
                                     dvdCountry: nil,
                                     externals: nil,
                                     image: nil,
                                     summary: nil,
                                     updated: 1611310521,
                                     links: nil))

let mockB = ShowElement(score: 0.9082468,
                          show: Show(id: 139,
                                     url: "https://www.tvmaze.com/shows/139/girls",
                                     name: "Girls",
                                     type: .value(type: "animation"),
                                     language: .value(name: nil),
                                     genres: ["Drama", "Romance"],
                                     status: Status.ended,
                                     runtime: 30,
                                     averageRuntime: 30,
                                     premiered: "2012-04-15",
                                     ended: "2017-04-16",
                                     officialSite: "http://www.hbo.com/girls",
                                     schedule: Schedule.init(time: "22:00", days: ["Sunday"]),
                                     rating: Rating.init(average: 6.7),
                                     weight: 97,
                                     network: nil,
                                     webChannel: nil,
                                     dvdCountry: nil,
                                     externals: nil,
                                     image: Image(medium: mediumImageURLString, original: originalImageURLString),
                                     summary: nil,
                                     updated: 1611310521,
                                     links: nil))
let mediumImageURLString = "https://static.tvmaze.com/uploads/images/medium_portrait/31/78286.jpg"
let originalImageURLString = "https://static.tvmaze.com/uploads/images/original_untouched/31/78286.jpg"
