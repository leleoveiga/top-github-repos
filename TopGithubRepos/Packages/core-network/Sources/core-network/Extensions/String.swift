//
//  String.swift
//  core-utility
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation

public extension String {
    func formatQueryEndpoint(params: Encodable) -> String {
        var ep = self
        
        for (key, value) in params.dictionary {
            ep = ep.replacingOccurrences(of: "{\(key)}", with: "\(value)")
        }
        
        return ep
    }
}
