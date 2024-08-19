//
//  Date.swift
//  core-utility
//
//  Created by Leonardo Veiga on 18/08/24.
//

import Foundation

public enum DateFormat: String, CaseIterable {
    case ddMMyyyy = "dd/MM/yyyy"
    case ddMMyyyyHhmm = "dd/MM/yyyy HH:mm"
//    "yyyy-MM-dd'T'HH:mm:ssZ"
    case yyyyMMddTHHmmssZ = "yyyy-MM-dd'T'HH:mm:ssZ"
}

public extension Date {
    func formatTo(_ format: DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = format.rawValue
        
        return dateFormatter.string(from: self)
    }
}

public extension String {
    func getDate(_ format: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")
        dateFormatter.dateFormat = format.rawValue
        
        return dateFormatter.date(from: self)
    }
}
