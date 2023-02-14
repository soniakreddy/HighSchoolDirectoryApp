//
//  StatisticsOverview.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct StatisticsOverview: Equatable {
    let collegeCareerRate: String
    let graduationRate: String
    
    static func == (lhs: StatisticsOverview, rhs: StatisticsOverview) -> Bool {
        return lhs.collegeCareerRate == rhs.collegeCareerRate && lhs.graduationRate == rhs.graduationRate
    }
}
