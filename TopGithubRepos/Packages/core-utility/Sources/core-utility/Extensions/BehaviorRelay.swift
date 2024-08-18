//
//  File.swift
//  core-utility
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation
import RxCocoa

public extension BehaviorRelay where Element: RangeReplaceableCollection {
    
    // MARK: - Append Elements
    func append(element: Element.Element) {
        var array = self.value
        array.append(element)
        self.accept(array)
    }
    
    func append(contentsOf array: [Element.Element]) {
        var newArray = self.value
        newArray.append(contentsOf: array)
        self.accept(newArray)
    }
    
}
