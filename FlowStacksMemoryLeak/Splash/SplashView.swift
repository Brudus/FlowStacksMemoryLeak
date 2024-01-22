//
//  SplashView.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import SwiftUI

struct SplashView: View {

    var viewModel: SplashViewModel

    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            Text("Loading some content")
        }
        .onAppear(perform: viewModel.onAppear)
    }
}
