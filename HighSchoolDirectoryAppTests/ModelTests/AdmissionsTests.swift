//
//  AdmissionsTests.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import XCTest

final class AdmissionsTests: XCTestCase {
    private var fakeAdmissions: Admissions!
    private let requirements = "Course Grades: English (87-100), Math (83-100), Social Studies (90-100), Science (88-100)"
    private let admissionPriorities = "Priority to continuing 8th graders"
    private let academicOpportunities = "The Learning to Work (LTW) partner for Liberation Diploma Plus High School is CAMBA."
    
    override func setUp() {
        super.setUp()
        
        fakeAdmissions = Admissions(requirements: "",
                                    admissionsPriorities: "",
                                    academicOpportunities: "")
    }

    func testFakeAdmissionsWithEmptyData() {
        XCTAssertEqual(fakeAdmissions.valueRows.count, 0)
    }
    
    func testFakeAdmissionsWithFullData() {
        fakeAdmissions = Admissions(requirements: requirements,
                                        admissionsPriorities: admissionPriorities,
                                        academicOpportunities: academicOpportunities)
        XCTAssertEqual(fakeAdmissions.valueRows.count, 3)
        XCTAssertEqual(fakeAdmissions.valueRows[0].title, Constants.requirementsTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[0].value, requirements)
        XCTAssertEqual(fakeAdmissions.valueRows[1].title, Constants.admissionPrioritiesTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[1].value, admissionPriorities)
        XCTAssertEqual(fakeAdmissions.valueRows[2].title, Constants.academicOpportunitiesTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[2].value, academicOpportunities)
    }
    
    func testFakeAdmissionsWithoutAcademicOpportunitiesData() {
        fakeAdmissions = Admissions(requirements: requirements,
                                        admissionsPriorities: admissionPriorities,
                                        academicOpportunities: "")
        XCTAssertEqual(fakeAdmissions.valueRows.count, 2)
        XCTAssertEqual(fakeAdmissions.valueRows[0].title, Constants.requirementsTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[0].value, requirements)
        XCTAssertEqual(fakeAdmissions.valueRows[1].title, Constants.admissionPrioritiesTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[1].value, admissionPriorities)
    }
    
    func testFakeAdmissionsWithoutAdmissionPrioritiesData() {
        fakeAdmissions = Admissions(requirements: requirements,
                                        admissionsPriorities: "",
                                        academicOpportunities: academicOpportunities)
        XCTAssertEqual(fakeAdmissions.valueRows.count, 2)
        XCTAssertEqual(fakeAdmissions.valueRows[0].title, Constants.requirementsTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[0].value, requirements)
        XCTAssertEqual(fakeAdmissions.valueRows[1].title, Constants.academicOpportunitiesTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[1].value, academicOpportunities)
    }
    
    func testFakeAdmissionsWithoutRequirementsData() {
        fakeAdmissions = Admissions(requirements: "",
                                        admissionsPriorities: admissionPriorities,
                                        academicOpportunities: academicOpportunities)
        XCTAssertEqual(fakeAdmissions.valueRows.count, 2)
        XCTAssertEqual(fakeAdmissions.valueRows[0].title, Constants.admissionPrioritiesTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[0].value, admissionPriorities)
        XCTAssertEqual(fakeAdmissions.valueRows[1].title, Constants.academicOpportunitiesTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[1].value, academicOpportunities)
    }
    
    func testFakeAdmissionsWithoutAcademicOpportunitiesAndAdmissionsPrioritiesData() {
        fakeAdmissions = Admissions(requirements: requirements,
                                        admissionsPriorities: "",
                                        academicOpportunities: "")
        XCTAssertEqual(fakeAdmissions.valueRows.count, 1)
        XCTAssertEqual(fakeAdmissions.valueRows[0].title, Constants.requirementsTitle)
        XCTAssertEqual(fakeAdmissions.valueRows[0].value, requirements)
    }
}
