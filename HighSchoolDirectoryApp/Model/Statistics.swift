//
//  Statistics.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct Statistics: Equatable {
    let statisticsOverview: StatisticsOverview
    let statisticsInfo: StatisticsInfo
    
    static func == (lhs: Statistics, rhs: Statistics) -> Bool {
        return lhs.statisticsOverview == rhs.statisticsOverview && lhs.statisticsInfo == rhs.statisticsInfo
    }
}
