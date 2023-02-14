//
//  SchoolTests.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import XCTest

final class SchoolDataTests: XCTestCase {
    let schoolDataContainer = SchoolDataContainer(generalDetails: fakeGeneralDetails,
                                     locationDetails: fakeLocationDetails,
                                     contactDetails: fakeContactDetails,
                                     programDetails: fakeProgramDetails,
                                     statistics: fakeStatistics)
    
    override func setUp() {
        super.setUp()
        
    }
    
    func testFakeAdmissionsWithEmptyData() {
        XCTAssertEqual(schoolDataContainer, fakeSchoolData.containerForSchoolData())
    }
}
