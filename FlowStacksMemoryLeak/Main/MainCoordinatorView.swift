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
        Router($viewModel.routes) { route, _ in
            switch route {
            case let .splash(viewModel):
                SplashView(viewModel: viewModel)
            case let .tab(viewModel):
                TabBarCoordinatorView(viewModel: viewModel)
            }
        }
    }
}
