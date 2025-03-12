//
//  MainRoute.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Djirlic on 25.02.25.
//

import Foundation

enum MainRoute: Hashable {
    case content(ContentViewModel)
}

// MARK: Equatable

extension MainRoute: Equatable {
    public static func == (lhs: MainRoute, rhs: MainRoute) -> Bool {
        true
    }
}
