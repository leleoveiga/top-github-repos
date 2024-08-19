//
//  File.swift
//  core-network
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation

// MARK: Prettify JSON String
extension String {
    func prettyPrintJSON() {
        guard let data = self.data(using: .utf8),
              let jsonData = try? JSONSerialization.jsonObject(with: data),
              let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonData, options: .prettyPrinted),
              let prettyJsonString = String(data: prettyJsonData, encoding: .utf8) else {
            print("Erro ao formatar JSON")
            print(self)
            return
        }
        
        print(prettyJsonString)
    }
}
