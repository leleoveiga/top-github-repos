//
//  File.swift
//  repositories-list
//
//  Created by Leonardo Veiga on 20/08/24.
//

import Foundation

extension String {
    var localize: String {
        return NSLocalizedString(self, bundle: .module, comment: "")
    }
}
