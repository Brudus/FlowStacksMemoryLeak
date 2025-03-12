//
//  ContentViewModel.swift
//  FlowStacksMemoryLeak
//
//  Created by Manuel Djirlic on 25.02.25.
//

import Foundation

struct ContentViewModel: Equatable, Hashable {
    static func == (lhs: ContentViewModel, rhs: ContentViewModel) -> Bool {
        lhs.text == rhs.text
    }
    
    let text: String

    init(text: String) {
        self.text = text
    }
}
