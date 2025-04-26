//
//  ClosureBasedTestModels.swift
//  DependencyContainer
//
//  Created by İhsan Akbay on 26.04.2025.
//

import Foundation

protocol ClosureBasedProtocol {
    func sampleMethod()
}

struct ClosureBasedImplementation: ClosureBasedProtocol {
    func sampleMethod() {}
}

protocol AnotherDependencyProtocol {
    func anotherSampleMethod()
}

struct AnotherDependencyImplemention: AnotherDependencyProtocol {
    private let servise: ClosureBasedProtocol

    init(servise: ClosureBasedProtocol) {
        self.servise = servise
    }

    func anotherSampleMethod() {}
}
