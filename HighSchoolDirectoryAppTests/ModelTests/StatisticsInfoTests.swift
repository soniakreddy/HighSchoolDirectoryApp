//
//  StatisticsInfoTests.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import XCTest

final class StatisticsInfoTests: XCTestCase {
    private var fakeStatisticsInfo: StatisticsInfo!
    private let pctStuEnoughVariety = "0.899999976"
    private let totalStudents = "376"
    private let pctStuSafe = "0.970000029"
    private let seats9Ge1 = "80"
    private let grade9GeFilledFlag1 = "Y"
    private let grade9GeApplicants1 = "1515"
    private let seats9Swd1 = "16"
    private let grade9SwdFilledFlag1 = "Y"
    private let grade9SwdApplicants1 = "138"
    private let attendanceRate = "0.970000029"
    
    override func setUp() {
        super.setUp()
        
        fakeStatisticsInfo = StatisticsInfo(pctStuEnoughVariety: "",
                                            totalStudents: "",
                                            pctStuSafe: "",
                                            seats9Ge1: "",
                                            grade9GeFilledFlag1: "",
                                            grade9GeApplicants1: "",
                                            seats9Swd1: "",
                                            grade9SwdFilledFlag1: "",
                                            grade9SwdApplicants1: "",
                                            attendanceRate: "")
    }
    
    func testStatisticsInfoWithEmptyData() {
        XCTAssertEqual(fakeStatisticsInfo.valueRows.count, 1)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[0].title, Constants.attendanceRateTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[0].value, "0%")
        XCTAssertFalse(fakeStatisticsInfo.valueRows[0].boolValue)
    }
    
    func testFakeStatisticsInfoWithData() {
        fakeStatisticsInfo = StatisticsInfo(pctStuEnoughVariety: pctStuEnoughVariety,
                                            totalStudents: totalStudents,
                                            pctStuSafe: pctStuSafe,
                                            seats9Ge1: seats9Ge1,
                                            grade9GeFilledFlag1: grade9GeFilledFlag1,
                                            grade9GeApplicants1: grade9GeApplicants1,
                                            seats9Swd1: seats9Swd1,
                                            grade9SwdFilledFlag1: grade9SwdFilledFlag1,
                                            grade9SwdApplicants1: grade9SwdApplicants1,
                                            attendanceRate: attendanceRate)

        XCTAssertEqual(fakeStatisticsInfo.valueRows.count, 10)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[0].title, Constants.attendanceRateTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[0].value, "97%")
        XCTAssertFalse(fakeStatisticsInfo.valueRows[0].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[1].title, Constants.enoughVarietyProgramsTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[1].value, "90%")
        XCTAssertFalse(fakeStatisticsInfo.valueRows[1].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[2].title, Constants.safetyTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[2].value, "97%")
        XCTAssertFalse(fakeStatisticsInfo.valueRows[2].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[3].title, Constants.totalStudentsTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[3].value, totalStudents)
        XCTAssertFalse(fakeStatisticsInfo.valueRows[3].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[4].title, Constants.numberOfAvailableNinthGradeSeatsTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[4].value, seats9Ge1)
        XCTAssertFalse(fakeStatisticsInfo.valueRows[4].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[5].title, Constants.numberOfAvailableNinthGradeSeatsDisabledTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[5].value, seats9Swd1)
        XCTAssertFalse(fakeStatisticsInfo.valueRows[5].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[6].title, Constants.numberOfApplicantsNinthGradeSeatsTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[6].value, grade9GeApplicants1)
        XCTAssertFalse(fakeStatisticsInfo.valueRows[6].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[7].title, Constants.numberOfApplicantsNinthGradeSeatsDisabledTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[7].value, grade9SwdApplicants1)
        XCTAssertFalse(fakeStatisticsInfo.valueRows[7].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[8].title, Constants.filledSeatsForNinthGradeProgramTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[8].value, grade9GeFilledFlag1)
        XCTAssertTrue(fakeStatisticsInfo.valueRows[8].boolValue)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[9].title, Constants.filledSeatsForNinthGradeProgramDisabledTitle)
        XCTAssertEqual(fakeStatisticsInfo.valueRows[9].value, grade9SwdFilledFlag1)
        XCTAssertTrue(fakeStatisticsInfo.valueRows[9].boolValue)

    }
}
