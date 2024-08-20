//
//  JSON.swift
//  core-utility
//
//  Created by Leonardo Veiga on 20/08/24.
//

import Foundation

public class MockUtils  {
    public static func extractModelFrom<T: Decodable>(json: String, key: String? = nil) -> T? {
        let decoder = JSONDecoder()
        if let key {
            let dict = try! decoder.decode([String: T].self, from: json.data(using: .utf8)!)
            return dict[key] ?? nil
        }
        let model = try! decoder.decode(T.self, from: json.data(using: .utf8)!)
        return model
    }
}
