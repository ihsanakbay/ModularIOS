//
//  DependencyContainerRegistrationType.swift
//  DependencyContainer
//
//  Created by İhsan Akbay on 26.04.2025.
//

import Foundation

public enum DependencyContainerRegistrationType {
    case singleInstance(AnyObject)
    case closureBased(() -> Any)
}
