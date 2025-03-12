//
//  ContentScreen.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Djirlic on 25.02.25.
//

import SwiftUI

struct ContentScreen: View {
    let viewModel: ContentViewModel

    var body: some View {
        Text(viewModel.text)
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
}
