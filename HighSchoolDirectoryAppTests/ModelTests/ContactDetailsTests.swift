//
//  ContactDetailsTests.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import XCTest

final class ContactDetailsTests: XCTestCase {
    private var fakeContactDetails: ContactDetails!
    let phoneNumber = "718-946-6812"
    let faxNumber = "718-946-6825"
    let schoolEmail = "scaraway@schools.nyc.gov"
    let website = "schools.nyc.gov/schoolportals/21/K728"
    
    override func setUp() {
        super.setUp()
        
        fakeContactDetails = ContactDetails(phoneNumber: "",
                                            faxNumber: "",
                                            schoolEmail: "",
                                            website: "")
    }
    
    func testFakeContactDetailsWithEmptyData() {
        XCTAssertEqual(fakeContactDetails.valueRows.count, 2)
        XCTAssertEqual(fakeContactDetails.valueRows[0].title, Constants.phoneNumberTitle)
        XCTAssertNotEqual(fakeContactDetails.valueRows[0].value, phoneNumber)
        XCTAssertEqual(fakeContactDetails.valueRows[0].value, "")
        XCTAssertEqual(fakeContactDetails.valueRows[1].title, Constants.websiteTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[1].value, "")
    }
    
    func testFakeContactDetailsWithFullData() {
        fakeContactDetails = ContactDetails(phoneNumber: phoneNumber,
                                            faxNumber: faxNumber,
                                            schoolEmail: schoolEmail,
                                            website: website)
        
        XCTAssertEqual(fakeContactDetails.valueRows.count, 4)
        XCTAssertEqual(fakeContactDetails.valueRows[0].title, Constants.phoneNumberTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[0].value, phoneNumber)
        XCTAssertEqual(fakeContactDetails.valueRows[1].title, Constants.faxNumberTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[1].value, faxNumber)
        XCTAssertEqual(fakeContactDetails.valueRows[2].title, Constants.schoolEmailTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[2].value, schoolEmail)
        XCTAssertEqual(fakeContactDetails.valueRows[3].title, Constants.websiteTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[3].value, website)
    }
    
    func testFakeContactDetailsWithoutFaxNumber() {
        fakeContactDetails = ContactDetails(phoneNumber: phoneNumber,
                                            faxNumber: "",
                                            schoolEmail: schoolEmail,
                                            website: website)
        
        XCTAssertEqual(fakeContactDetails.valueRows.count, 3)
        XCTAssertEqual(fakeContactDetails.valueRows[0].title, Constants.phoneNumberTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[0].value, phoneNumber)
        XCTAssertEqual(fakeContactDetails.valueRows[1].title, Constants.schoolEmailTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[1].value, schoolEmail)
        XCTAssertEqual(fakeContactDetails.valueRows[2].title, Constants.websiteTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[2].value, website)
    }
    
    func testFakeContactDetailsWithoutSchoolEmail() {
        fakeContactDetails = ContactDetails(phoneNumber: phoneNumber,
                                            faxNumber: faxNumber,
                                            schoolEmail: "",
                                            website: website)
        
        XCTAssertEqual(fakeContactDetails.valueRows.count, 3)
        XCTAssertEqual(fakeContactDetails.valueRows[0].title, Constants.phoneNumberTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[0].value, phoneNumber)
        XCTAssertEqual(fakeContactDetails.valueRows[1].title, Constants.faxNumberTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[1].value, faxNumber)
        XCTAssertEqual(fakeContactDetails.valueRows[2].title, Constants.websiteTitle)
        XCTAssertEqual(fakeContactDetails.valueRows[2].value, website)
    }

}
