//
//  BerryApp.swift
//  Sample
//
//  Created by A H on 2023-01-27.
//

import SwiftUI

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ShowListView(viewModel: tvShowViewModel)
        }
    }
}
