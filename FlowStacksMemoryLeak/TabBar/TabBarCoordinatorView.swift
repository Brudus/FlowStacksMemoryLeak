//
//  TabBarCoordinatorView.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import SwiftUI

struct TabBarCoordinatorView: View {

    var viewModel: TabBarCoordinatorViewModel

    var body: some View {
        VStack {
            Text("TabBar")
            Button("Reset") {
                viewModel.onRestartTapped()
            }
        }
    }
}
