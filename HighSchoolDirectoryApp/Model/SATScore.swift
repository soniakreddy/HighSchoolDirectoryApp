//
//  SATScore.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct SATScore: Codable, Identifiable, Equatable {
    var id = UUID()
    let dbn: String
    let schoolName: String
    let numOfSatTestTakers: String
    let satCriticalReadingAvgScore: String
    let satMathAvgScore: String
    let satWritingAvgScore: String
    
    private enum CodingKeys: String, CodingKey {
        case dbn
        case schoolName = "school_name"
        case numOfSatTestTakers = "num_of_sat_test_takers"
        case satCriticalReadingAvgScore = "sat_critical_reading_avg_score"
        case satMathAvgScore = "sat_math_avg_score"
        case satWritingAvgScore = "sat_writing_avg_score"
    }
    
    static func == (lhs: SATScore, rhs: SATScore) -> Bool {
        return lhs.dbn == rhs.dbn && lhs.schoolName == rhs.schoolName && lhs.numOfSatTestTakers == rhs.numOfSatTestTakers && lhs.satCriticalReadingAvgScore == rhs.satCriticalReadingAvgScore && lhs.satMathAvgScore == rhs.satMathAvgScore && lhs.satWritingAvgScore == rhs.satWritingAvgScore
    }
    
}
