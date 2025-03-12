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

    @Published public var routes: [Route<Screen>]
    public var cancellables = Set<AnyCancellable>()
    public let identifier = UUID()

    public init(initialRoutes: Routes<Screen> = []) {
        routes = initialRoutes
        logRouteChanges()
    }

    open func initialize() {
        // optionally called by subclasses
    }

    public func setRoutes(to newRoutes: Routes<Screen>) {
        routes = newRoutes
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

// MARK: Hashable

extension CoordinatorModel: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
}

// MARK: Equatable

extension CoordinatorModel: Equatable {
    public static func == (lhs: CoordinatorModel, rhs: CoordinatorModel) -> Bool {
        lhs.identifier == rhs.identifier
    }
}
