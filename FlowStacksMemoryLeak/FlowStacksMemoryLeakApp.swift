//
//  FlowStacksMemoryLeakApp.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import SwiftUI

@main
struct FlowStacksMemoryLeakApp: App {

    @StateObject private var mainCoordinatorViewModel = MainCoordinatorViewModel()

    var body: some Scene {
        WindowGroup {
            MainCoordinatorView(viewModel: mainCoordinatorViewModel)
        }
    }
}
