//
//  SplashViewModel.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import Foundation

final class SplashViewModel {

    private let onFinishedLoading: () -> Void

    init(onFinishedLoading: @escaping () -> Void) {
        self.onFinishedLoading = onFinishedLoading
    }

    func onAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.onFinishedLoading()
        }
    }
}
