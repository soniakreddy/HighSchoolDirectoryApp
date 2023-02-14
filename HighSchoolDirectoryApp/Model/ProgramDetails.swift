//
//  ProgramDetails.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct ProgramDetails: Equatable {
    let programOverview: ProgramOverview
    let facilities: Facilities
    let admissions: Admissions
    let satScore: SATScore
    
    static func == (lhs: ProgramDetails, rhs: ProgramDetails) -> Bool {
        return lhs.programOverview == rhs.programOverview && lhs.facilities == rhs.facilities && lhs.admissions == rhs.admissions && lhs.satScore == rhs.satScore 
    }
}
