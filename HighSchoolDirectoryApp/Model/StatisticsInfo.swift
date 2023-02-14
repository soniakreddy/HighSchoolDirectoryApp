//
//  StatisticsInfo.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct StatisticsInfo: Equatable {
    let pctStuEnoughVariety: String?
    let totalStudents: String?
    let pctStuSafe: String?
    let seats9Ge1: String?
    let grade9GeFilledFlag1: String?
    let grade9GeApplicants1: String?
    let seats9Swd1: String?
    let grade9SwdFilledFlag1: String?
    let grade9SwdApplicants1: String?
    let attendanceRate: String
    
    // Creating an non empty array consisting of tuples to hold title & value of each row.
    var valueRows: [(title: String, value: String, boolValue: Bool)] {
        var valueRows = [(title: String, value: String, boolValue: Bool)]()
        
        valueRows.append((title: Constants.attendanceRateTitle, value: attendanceRate.convertStringToPercent(), boolValue: attendanceRate.getBoolValueFromCharacter()))
        
        if let pctStuEnoughVariety = pctStuEnoughVariety, !pctStuEnoughVariety.isEmpty {
            valueRows.append((title: Constants.enoughVarietyProgramsTitle, value: pctStuEnoughVariety.convertStringToPercent(), boolValue: pctStuEnoughVariety.getBoolValueFromCharacter()))
        }
        
        if let pctStuSafe = pctStuSafe, !pctStuSafe.isEmpty {
            valueRows.append((title: Constants.safetyTitle, value: pctStuSafe.convertStringToPercent(), boolValue: pctStuSafe.getBoolValueFromCharacter()))
        }
        
        if let totalStudents = totalStudents, !totalStudents.isEmpty {
            valueRows.append((title: Constants.totalStudentsTitle, value: totalStudents, boolValue: totalStudents.getBoolValueFromNumber()))
        }
        
        if let seats9Ge1 = seats9Ge1, !seats9Ge1.isEmpty {
            valueRows.append((title: Constants.numberOfAvailableNinthGradeSeatsTitle, value: seats9Ge1, boolValue: seats9Ge1.getBoolValueFromCharacter()))
        }
        
        if let seats9Swd1 = seats9Swd1, !seats9Swd1.isEmpty {
            valueRows.append((title: Constants.numberOfAvailableNinthGradeSeatsDisabledTitle, value: seats9Swd1, boolValue: seats9Swd1.getBoolValueFromCharacter()))
        }
        
        if let grade9GeApplicants1 = grade9GeApplicants1, !grade9GeApplicants1.isEmpty {
            valueRows.append((title: Constants.numberOfApplicantsNinthGradeSeatsTitle, value: grade9GeApplicants1, boolValue: grade9GeApplicants1.getBoolValueFromCharacter()))
        }
        
        if let grade9SwdApplicants1 = grade9SwdApplicants1, !grade9SwdApplicants1.isEmpty {
            valueRows.append((title: Constants.numberOfApplicantsNinthGradeSeatsDisabledTitle, value: grade9SwdApplicants1, boolValue: grade9SwdApplicants1.getBoolValueFromCharacter()))
        }
        
        if let grade9GeFilledFlag1 = grade9GeFilledFlag1, !grade9GeFilledFlag1.isEmpty {
            valueRows.append((title: Constants.filledSeatsForNinthGradeProgramTitle, value: grade9GeFilledFlag1, boolValue: grade9GeFilledFlag1.getBoolValueFromCharacter()))
        }
        if let grade9SwdFilledFlag1 = grade9SwdFilledFlag1, !grade9SwdFilledFlag1.isEmpty {
            valueRows.append((title: Constants.filledSeatsForNinthGradeProgramDisabledTitle, value: grade9SwdFilledFlag1, boolValue: grade9SwdFilledFlag1.getBoolValueFromCharacter()))
        }
        
        return valueRows
    }
}
