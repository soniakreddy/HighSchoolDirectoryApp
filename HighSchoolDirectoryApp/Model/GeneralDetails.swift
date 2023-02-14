//
//  GeneralDetails.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct GeneralDetails: Equatable {
    let overview: String
    let schoolName: String
    
    static func == (lhs: GeneralDetails, rhs: GeneralDetails) -> Bool {
        return lhs.overview == rhs.overview && lhs.schoolName == rhs.schoolName
    }
}
