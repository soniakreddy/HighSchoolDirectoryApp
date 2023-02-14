//
//  ContactDetails.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct ContactDetails: Equatable {
    let phoneNumber: String
    let faxNumber: String?
    let schoolEmail: String?
    let website: String
    
    static func == (lhs: ContactDetails, rhs: ContactDetails) -> Bool {
        return lhs.phoneNumber == rhs.phoneNumber && lhs.faxNumber == rhs.faxNumber && lhs.schoolEmail == rhs.schoolEmail && lhs.website == rhs.website
    }
    
    // Creating an non empty array consisting of tuples to hold title & value of each row.
    var valueRows: [(title: String, value: String)] {
        var valueRows = [(title: String, value: String)]()
        valueRows.append((title: Constants.phoneNumberTitle, value: phoneNumber))
        
        if let faxNumber = faxNumber, !faxNumber.isEmpty {
            valueRows.append((title: Constants.faxNumberTitle, value: faxNumber))
        }
        
        if let schoolEmail = schoolEmail, !schoolEmail.isEmpty {
            valueRows.append((title: Constants.schoolEmailTitle, value: schoolEmail))
        }

        valueRows.append((title: Constants.websiteTitle, value: website))
        return valueRows
    }
}
