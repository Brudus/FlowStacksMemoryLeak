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
        NavigationView {
            VStack {
                Text("TabBar")
                Button("Reset") {
                    viewModel.onRestartTapped()
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button(
                        action: {
                            print("Pressed")
                        },
                        label: {
                            Image(systemName: "plus")
                        }
                    )
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}
