//
//  ProgramOverviewTests.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import XCTest

final class ProgramOverviewTests: XCTestCase {
    private var fakeProgramOverview: ProgramOverview!
    private let eligibility = "For Current 8th Grade St…l for at least one year"
    private let advancedPlacementCourses = "AP Calculus, AP English, AP Spanish, AP Studio Art, AP US Government and Politics"
    let languageClasses = "French, Spanish"
    
    override func setUp() {
        super.setUp()
        
        fakeProgramOverview = ProgramOverview(eligibility: "",
                                              advancedPlacementCourses: "",
                                              languageClasses: "")
    }
    
    func testFakeProgramOverviewWithEmptyData() {
        XCTAssertEqual(fakeProgramOverview.getValueRow(.eligibility).title, Constants.eligibilityTitle)
        XCTAssertEqual(fakeProgramOverview.getValueRow(.eligibility).value, "")
        XCTAssertEqual(fakeProgramOverview.getValueRow(.advancedPlacementCourses).title, Constants.apCoursesTitle)
        XCTAssertEqual(fakeProgramOverview.getValueRow(.advancedPlacementCourses).value, "")
        XCTAssertEqual(fakeProgramOverview.getValueRow(.languageClasses).title, Constants.languageClassesTitle)
        XCTAssertEqual(fakeProgramOverview.getValueRow(.languageClasses).value, "")
    }
    
    func testFakeProgramOverviewWithFullData() {
        fakeProgramOverview = ProgramOverview(eligibility: eligibility,
                                              advancedPlacementCourses: advancedPlacementCourses,
                                              languageClasses: languageClasses)
        
        XCTAssertEqual(fakeProgramOverview.getValueRow(.eligibility).title, Constants.eligibilityTitle)
        XCTAssertEqual(fakeProgramOverview.getValueRow(.eligibility).value, eligibility)
        XCTAssertEqual(fakeProgramOverview.getValueRow(.advancedPlacementCourses).title, Constants.apCoursesTitle)
        XCTAssertEqual(fakeProgramOverview.getValueRow(.advancedPlacementCourses).value, advancedPlacementCourses)
        XCTAssertEqual(fakeProgramOverview.getValueRow(.languageClasses).title, Constants.languageClassesTitle)
        XCTAssertEqual(fakeProgramOverview.getValueRow(.languageClasses).value, languageClasses)
    }
}
