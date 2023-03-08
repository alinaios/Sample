//
//  RegisteredService.swift
//  Sample
//
//  Created by A H on 2023-01-29.
//

import Foundation

let projectBaseURL = "https://api.tvmaze.com/"
let tvShowService = TVShowDataFetchManager(with: URLSessionManager())
let tvShowViewModel = ShowListViewModel(service: tvShowService)
