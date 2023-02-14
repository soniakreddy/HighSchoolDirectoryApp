//
//  Admissions.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct Admissions: Equatable {
    let requirements: String?
    let admissionsPriorities: String?
    let academicOpportunities: String?
    
    static func == (lhs: Admissions, rhs: Admissions) -> Bool {
        return lhs.requirements == rhs.requirements && lhs.admissionsPriorities == rhs.admissionsPriorities && lhs.academicOpportunities == rhs.academicOpportunities
    }

    // Creating an non empty array consisting of tuples to hold title & value of each row.    
    var valueRows: [(title: String, value: String)] {
        var valueRows = [(title: String, value: String)]()
        if let requirements = requirements, !requirements.isEmpty {
            valueRows.append((title: Constants.requirementsTitle, value: requirements))
        }
        
        if let admissionsPriorities = admissionsPriorities, !admissionsPriorities.isEmpty {
            valueRows.append((title: Constants.admissionPrioritiesTitle, value: admissionsPriorities))
        }
        
        if let academicOpportunities = academicOpportunities, !academicOpportunities.isEmpty {
            valueRows.append((title: Constants.academicOpportunitiesTitle, value: academicOpportunities))
        }
        
        return valueRows
    }
}
