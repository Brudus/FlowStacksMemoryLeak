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

    private var oldRoutes: Routes<Screen>?

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
                receiveOutput: { [weak self] newRoutes in
                    guard let self else {
                        return
                    }
                    self.oldRoutes = newRoutes

                    if let lastRoute = newRoutes.last?.screen {
                        LastRoute.value = String(reflecting: lastRoute)
                    }
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
