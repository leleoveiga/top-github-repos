//
//  Encodable.swift
//  core-network
//
//  Created by Leonardo Veiga on 17/08/24.
//

import Foundation

public extension Encodable {
    var dictionary: [String: Any] {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970
        guard let data = try? encoder.encode(self) else { return [String: Any]() }
        let returnValue = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
        return returnValue ?? [String: Any]()
    }
}
