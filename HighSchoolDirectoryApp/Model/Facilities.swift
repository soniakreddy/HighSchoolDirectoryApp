//
//  Facilities.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct ValueRow {
    let title: String
    let value: String
    let boolValue: Bool
}

struct Facilities: Equatable {
    let schoolTenthSeats: String?
    let schoolAccessibilityDescription: String?
    let girls: String?
    let boys: String?
    let pbat: String?
    let international: String?
    let specialized: String?
    let transfer: String?
    let ptech: String?
    let earlyCollege: String?
    let geoEligibility: String?
    let psalSportsBoys: String?
    let psalSportsGirls: String?
    let psalSportsCoed: String?
    let schoolSports: String?
    let extracurricularActivities: String?
    
    var isGeoEligible: Bool {
        return !(geoEligibility?.isEmpty ?? false)
    }
    
    // Creating an array of array to hold three main sections, third section holds extracurricularActivities, second section holds schoolSports & the first section holds the remaining details.
    //Each value in ValueRow holds a title, value & boolValue which we set here.
    var valueRows: [[ValueRow]] {
        var valueRows = [[ValueRow]]()
        
        var detailsValueRows = [ValueRow]()
        
        if let schoolTenthSeats = schoolTenthSeats, !schoolTenthSeats.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.offerTenthGradeSeatsTitle, value: schoolTenthSeats, boolValue: schoolTenthSeats.getBoolValueFromNumber()))
        }
        
        if let schoolAccessibilityDescription = schoolAccessibilityDescription, !schoolAccessibilityDescription.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.schoolSiteAccessibleTitle, value: schoolAccessibilityDescription, boolValue: schoolAccessibilityDescription.getBoolValueFromNumber()))
        }
        
        if let girls = girls, !girls.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.femaleOnlySchoolTitle, value: girls, boolValue: girls.getBoolValueFromNumber()))
        }
        
        if let boys = boys, !boys.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.maleOnlySchoolTitle, value: boys, boolValue: boys.getBoolValueFromNumber()))
        }
        
        if let pbat = pbat, !pbat.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.pbatSupportedTitle, value: pbat, boolValue: pbat.getBoolValueFromNumber()))
        }
        
        if let ptech = ptech, !ptech.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.ptechSupportedTitle, value: ptech, boolValue: ptech.getBoolValueFromNumber()))
        }

        
        if let international = international, !international.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.internationalTitle, value: international, boolValue: international.getBoolValueFromNumber()))
        }
        
        if let specialized = specialized, !specialized.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.specializedTitle, value: specialized, boolValue: specialized.getBoolValueFromNumber()))
        }
        
        if let transfer = transfer, !transfer.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.transferTitle, value: transfer, boolValue: transfer.getBoolValueFromNumber()))
        }
        
        if let earlyCollege = earlyCollege, !earlyCollege.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.earlyCollegeTitle, value: earlyCollege, boolValue: earlyCollege.getBoolValueFromNumber()))
        }
        
        if let geoEligibility = geoEligibility, !geoEligibility.isEmpty {
            detailsValueRows.append(ValueRow(title: Constants.geographicEligibilityTitle, value: geoEligibility, boolValue: geoEligibility.getBoolValueFromNumber()))
        }
        
        if detailsValueRows.count > 0 {
            valueRows.append(detailsValueRows)
        }
        
        let allSports = [schoolSports, psalSportsBoys, psalSportsGirls, psalSportsCoed].compactMap { $0 }.filter { !$0.isEmpty }
        let allSportsString = allSports.joined(separator: ", ")
        let allSportsArray = allSportsString.components(separatedBy: ", ")
        let allSportsSet = Set(allSportsArray)
        let allSportsWithoutRepititionString = Array(allSportsSet).joined(separator: ", ")
        if allSports.count > 0 {
            valueRows.append([ValueRow(title: Constants.sportsFacilitiesTitle, value: allSportsWithoutRepititionString, boolValue: false)])
        }
        
        if let extracurricularActivities = extracurricularActivities, !extracurricularActivities.isEmpty {
            valueRows.append([ValueRow(title: Constants.extraCurricularFacilitiesTitle, value: extracurricularActivities, boolValue: false)]) 
        }
        
        return valueRows
    }
}
