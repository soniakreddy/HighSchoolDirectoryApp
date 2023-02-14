//
//  ProgramOverview.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

enum ProgramOverviewDetails: Int, CaseIterable {
    case eligibility = 0
    case advancedPlacementCourses
    case languageClasses
}

struct ProgramOverview: Equatable {
    let eligibility: String?
    let advancedPlacementCourses: String?
    let languageClasses: String?
    
    // Creating a tuple which holds title & value of each row based on enum
    func getValueRow(_ programOverviewDetails: ProgramOverviewDetails) -> (title: String, value: String?) {
        switch programOverviewDetails {
        case .eligibility:
            return (Constants.eligibilityTitle, eligibility)
        case .advancedPlacementCourses:
            return (Constants.apCoursesTitle, advancedPlacementCourses)
        case .languageClasses:
            return (Constants.languageClassesTitle, languageClasses)
        }
    }
}
