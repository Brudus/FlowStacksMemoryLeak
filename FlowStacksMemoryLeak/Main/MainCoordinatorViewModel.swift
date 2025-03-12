//
//  MainCoordinatorViewModel.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import FlowStacks
import SwiftUI

final class MainCoordinatorViewModel: CoordinatorModel<MainRoute> {

    @Published private(set) var root: MainCoordinatorViewModel.Root?

    var useNavigation: Bool {
        if case .tab = root {
            return true
        }
        return false
    }


    init() {
        super.init(initialRoutes: [])
        setSplashAsRoot()
    }

    private func setSplashAsRoot() {
        let viewModel = SplashViewModel(onFinishedLoading: setTabAsRoot)
        root = .splash(viewModel)
    }

    private func setTabAsRoot() {
        let viewModel = TabBarCoordinatorViewModel(onRestart: setSplashAsRoot)
        root = .tab(viewModel)
    }
}

extension MainCoordinatorViewModel {
    enum Root {
        case splash(SplashViewModel)
        case tab(TabBarCoordinatorViewModel)
    }
}

extension MainCoordinatorViewModel.Root: Equatable {
    static func == (lhs: MainCoordinatorViewModel.Root, rhs: MainCoordinatorViewModel.Root) -> Bool {
        switch (lhs, rhs) {
        case (.splash, .splash):
            return true
        case (.tab, .tab):
            return true
        default:
            return false
        }
    }
}
