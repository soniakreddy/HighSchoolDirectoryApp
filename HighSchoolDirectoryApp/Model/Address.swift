//
//  Address.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct Address: Codable, Equatable {
    let schoolName: String
    let primaryAddressLine: String
    let city: String
    let stateCode: String
    let zipCode: String
    let location: String
    let latitude: String?
    let longitude: String?
    
    static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.schoolName == rhs.schoolName && lhs.primaryAddressLine == rhs.primaryAddressLine && lhs.city == rhs.city && lhs.stateCode == rhs.stateCode && lhs.zipCode == rhs.zipCode && lhs.location == rhs.location && lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
