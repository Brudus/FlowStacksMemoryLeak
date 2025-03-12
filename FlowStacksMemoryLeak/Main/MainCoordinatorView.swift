//
//  MainCoordinatorView.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import FlowStacks
import SwiftUI

struct MainCoordinatorView: View {

    @ObservedObject var viewModel: MainCoordinatorViewModel

    var body: some View {
        FlowStack($viewModel.routes, withNavigation: viewModel.useNavigation) {
            rootView
                .navigationViewStyle(.stack)
                .flowDestination(for: MainRoute.self) { route in
                    screen(for: route)
                }
        }
    }

    // MARK: - Private

    @ViewBuilder private var rootView: some View {
        switch viewModel.root {
        case let .splash(viewModel):
            SplashView(viewModel: viewModel)
        case let .tab(viewModel):
            TabBarCoordinatorView(viewModel: viewModel)
        case .none:
            EmptyView()
        }
    }

    @ViewBuilder private func screen(for route: MainRoute) -> some View {
        switch route {
        case let .content(viewModel):
            ContentScreen(viewModel: viewModel)
        }
    }
}
