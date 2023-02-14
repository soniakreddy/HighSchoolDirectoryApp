//
//  String+Extensions.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

extension String {
    
    func toPhoneNumber() -> String {
        let parsed = replacingOccurrences(of: "-", with: "")
        return parsed.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: nil)
    }
    
    func getBoolValueFromNumber() -> Bool {
        return self == "1"
    }
    
    func getBoolValueFromCharacter() -> Bool {
        return self == "Y"
    }
    
    func convertStringToPercent() -> String {
        return String(format: "%.f", (Double(self) ?? 0) * 100) + "%"
    }
}
