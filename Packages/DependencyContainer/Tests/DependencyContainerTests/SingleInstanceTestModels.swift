//
//  SingleInstanceTestModels.swift
//  DependencyContainer
//
//  Created by İhsan Akbay on 26.04.2025.
//

import Foundation

protocol SingleInstanceProtocol: AnyObject {
    func sampleMethod()
}

final class SingleInstanceImplementation: SingleInstanceProtocol {
    func sampleMethod() {
        // left blank intentionally
    }
}
