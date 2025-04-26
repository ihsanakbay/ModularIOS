//
//  String+Extensions.swift
//  Utilities
//
//  Created by İhsan Akbay on 26.04.2025.
//

import Foundation

public extension String {
    var localised: String {
        NSLocalizedString(self, comment: "")
    }

    func localised(bundle: Bundle) -> String {
        NSLocalizedString(self, bundle: bundle, comment: "")
    }
}
