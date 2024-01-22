//
//  RoutesPublishingObject.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Schulze on 18.01.24.
//

import FlowStacks
import Foundation

protocol RoutesPublishingObject: ObservableObject {
    associatedtype Screen
    var routes: Routes<Screen> { get }
    func initialize()
}
