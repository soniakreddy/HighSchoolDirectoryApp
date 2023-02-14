//
//  FacilitiesTests.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import XCTest

final class FacilitiesTests: XCTestCase {
    private var fakeFacilities: Facilities!
    private let schoolTenthSeats = "1"
    private let schoolAccessibilityDescription = "1"
    private let girls = "1"
    private let boys = "1"
    private let pbat = "1"
    private let international = "1"
    private let specialized = "1"
    private let transfer = "1"
    private let ptech = "1"
    private let earlyCollege = "1"
    private let geoEligibility = "Open only to Bronx students/residents"
    private let psalSportsBoys =  "Baseball, Basketball, Bowling, Cross Country, Outdoor Track, Soccer, Tennis, Volleyball, Wrestling"
    private let psalSportsGirls = "Basketball, Cross Country, Handball, Indoor Track, Outdoor Track, Soccer, Softball, Tennis, Volleyball"
    private let psalSportsCoed = "Cricket"
    private let schoolSports = "Badminton, Baseball, Fitness, Football, Soccer, Yoga, Volleyball, Basketball"
    private let extracurricularActivities = "Leadership Project/Student Congress, Peer Tutoring, Advanced English, Art Design and Exhibition, Baile Folklorico/Dance Club, Art Club, Family Festivals, Guitar/Music Club, ELA/Math Regents Prep, Latino Youth for Higher Education Program (LYHEP), Newspaper, Photography, Social Action Projects and Campaigns, Sports, Talent Show, Theater, Zumba Classes, Spanish Literacy, Student Life, Asian Appreciation Club, English as a New Language Beginners Class, Story Studio, Fresh Prep, Movie Club"
    
    override func setUp() {
        super.setUp()
        
        fakeFacilities = Facilities(schoolTenthSeats: "",
                                    schoolAccessibilityDescription: "",
                                    girls: "",
                                    boys: "",
                                    pbat: "",
                                    international: "",
                                    specialized: "",
                                    transfer: "",
                                    ptech: "",
                                    earlyCollege: "",
                                    geoEligibility: "",
                                    psalSportsBoys: "",
                                    psalSportsGirls: "",
                                    psalSportsCoed: "",
                                    schoolSports: "",
                                    extracurricularActivities: "")
    }
    
    func testFakeFacilitiesWithEmptyData() {
        XCTAssertEqual(fakeFacilities.valueRows.count, 0)
    }
    
    func testFakeFacilitiesWithFullData() {
        fakeFacilities = Facilities(schoolTenthSeats: schoolTenthSeats,
                                    schoolAccessibilityDescription: schoolAccessibilityDescription,
                                    girls: girls,
                                    boys: boys,
                                    pbat: pbat,
                                    international: international,
                                    specialized: specialized,
                                    transfer: transfer,
                                    ptech: ptech,
                                    earlyCollege: earlyCollege,
                                    geoEligibility: geoEligibility,
                                    psalSportsBoys: psalSportsBoys,
                                    psalSportsGirls: psalSportsGirls,
                                    psalSportsCoed: psalSportsCoed,
                                    schoolSports: schoolSports,
                                    extracurricularActivities: extracurricularActivities)

        XCTAssertEqual(fakeFacilities.valueRows.count, 3)
        XCTAssertEqual(fakeFacilities.valueRows[0].count, 11)
        XCTAssertEqual(fakeFacilities.valueRows[0][0].title, Constants.offerTenthGradeSeatsTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][0].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][0].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][1].title, Constants.schoolSiteAccessibleTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][1].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][1].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][2].title, Constants.femaleOnlySchoolTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][2].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][2].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][3].title, Constants.maleOnlySchoolTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][3].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][3].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][4].title, Constants.pbatSupportedTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][4].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][4].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][5].title, Constants.ptechSupportedTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][5].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][5].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][6].title, Constants.internationalTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][6].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][6].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][7].title, Constants.specializedTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][7].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][7].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][8].title, Constants.transferTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][8].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][8].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][9].title, Constants.earlyCollegeTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][9].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][9].boolValue)
        XCTAssertEqual(fakeFacilities.valueRows[0][10].title, Constants.geographicEligibilityTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][10].value, geoEligibility)
        XCTAssertFalse(fakeFacilities.valueRows[0][10].boolValue)
        
        XCTAssertEqual(fakeFacilities.valueRows[1].count, 1)
        XCTAssertEqual(fakeFacilities.valueRows[1][0].title, Constants.sportsFacilitiesTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][1].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][1].boolValue)
        
        XCTAssertEqual(fakeFacilities.valueRows[2].count, 1)
        XCTAssertEqual(fakeFacilities.valueRows[2][0].title, Constants.extraCurricularFacilitiesTitle)
        XCTAssertEqual(fakeFacilities.valueRows[0][2].value, "1")
        XCTAssertTrue(fakeFacilities.valueRows[0][2].boolValue)
    }
}
