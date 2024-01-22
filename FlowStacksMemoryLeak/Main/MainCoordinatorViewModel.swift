//
//  MainCoordinatorViewModel.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import FlowStacks
import SwiftUI

final class MainCoordinatorViewModel: CoordinatorModel<MainCoordinatorScreen> {

    init() {
        super.init(initialRoutes: [])
        setSplashAsRoot()
    }

    private func setSplashAsRoot() {
        let viewModel = SplashViewModel(onFinishedLoading: setTabAsRoot)
        setRoot(.splash(viewModel))
    }

    private func setTabAsRoot() {
        let viewModel = TabBarCoordinatorViewModel(onRestart: setSplashAsRoot)
        setRoot(.tab(viewModel), embedInNavigationView: true)
    }
}
