//
//  TabBarCoordinatorViewModel.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import Foundation

final class TabBarCoordinatorViewModel {

    private let onRestart: () -> Void

    init(onRestart: @escaping () -> Void) {
        self.onRestart = onRestart
        print("### Creates instance \(ObjectIdentifier(self))")
    }

    deinit {
        print("### Deinit called \(ObjectIdentifier(self))")
    }

    func onRestartTapped() {
        onRestart()
    }
}
