//
//  CoordinatorModel.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import Combine
import Foundation
import FlowStacks

open class CoordinatorModel<Screen>: RoutesPublishingObject {
    public typealias State = Routes<Screen>

    @Published public var routes: Routes<Screen>
    public var cancellables = Set<AnyCancellable>()

    public init(initialRoutes: Routes<Screen> = []) {
        routes = initialRoutes
        logRouteChanges()
    }

    open func initialize() {
        // optionally called by subclasses
    }

    public func setRoot(_ screen: Screen, embedInNavigationView: Bool = false) {
        routes = [.root(screen, embedInNavigationView: embedInNavigationView)]
    }

    private func logRouteChanges() {
        $routes
            .handleEvents(
                receiveOutput: { newRoutes in
                    print("### Subscription triggered")
                },
                receiveRequest: { [weak self] _ in
                    guard let self else {
                        return
                    }
                    self.initialize()
                }
            )
            .sink(receiveValue: { _ in })
            .store(in: &cancellables)
    }
}
