//
//  NeighborhoodDetailsTests.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import XCTest

final class NeighborhoodDetailsTests: XCTestCase {
    private var fakeNeighborhoodDetails: NeighborhoodDetails!
    private let campusName = "Prospect Heights Educational Campus"
    private let boro = "M"
    private let neighborhood = "Chelsea-Union Sq"
    private let buildingCode = "M868"
    private let communityBoard = "5"
    private let councilDistrict = "2"
    private let censusTract = "52"
    private let bin = "1089902"
    private let bbl = "1008420034"
    private let nta = "Hudson Yards-Chelsea-Flatiron-Union Square "
    private let borough = "MANHATTAN"
    
    override func setUp() {
        super.setUp()
        
        fakeNeighborhoodDetails = NeighborhoodDetails(campusName: "",
                                                      boro: "",
                                                      neighborhood: "",
                                                      buildingCode: "",
                                                      communityBoard: "",
                                                      councilDistrict: "",
                                                      censusTract: "",
                                                      bin: "",
                                                      bbl: "",
                                                      nta: "",
                                                      borough: "")
    }
    
    func testFakeNeighborhoodDetailsWithEmptyData() {
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows.count, 2)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[0].title, Constants.neighborhoodAreaTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[0].value, "")
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[1].title, Constants.boroughTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[1].value, "")
    }
    
    func testFakeNeighborhoodDetailsWithData() {
        fakeNeighborhoodDetails = NeighborhoodDetails(campusName: campusName,
                                                      boro: boro,
                                                      neighborhood: neighborhood,
                                                      buildingCode: buildingCode,
                                                      communityBoard: communityBoard,
                                                      councilDistrict: councilDistrict,
                                                      censusTract: censusTract,
                                                      bin: bin,
                                                      bbl: bbl,
                                                      nta: nta,
                                                      borough: borough)
        
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows.count, 11)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[0].title, Constants.neighborhoodAreaTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[0].value, neighborhood)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[1].title, Constants.boroughTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[1].value, boro)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[2].title, Constants.boroughAreaTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[2].value, borough)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[3].title, Constants.campusNameTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[3].value, campusName)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[4].title, Constants.buildingCodeTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[4].value, buildingCode)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[5].title, Constants.communityBoardTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[5].value, communityBoard)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[6].title, Constants.councilDistrictTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[6].value, councilDistrict)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[7].title, Constants.censusTractTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[7].value, censusTract)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[8].title, Constants.buildingIdentificationTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[8].value, bin)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[9].title, Constants.boroughBuildingLotNumberTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[9].value, bbl)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[10].title, Constants.neighborhoodTabulationAreaTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[10].value, nta)
        
    }
    
    func testFakeNeighborhoodDetailsWithPartialData() {
        fakeNeighborhoodDetails = NeighborhoodDetails(campusName: campusName,
                                                      boro: boro,
                                                      neighborhood: neighborhood,
                                                      buildingCode: buildingCode,
                                                      communityBoard: communityBoard,
                                                      councilDistrict: "",
                                                      censusTract: "",
                                                      bin: "",
                                                      bbl: "",
                                                      nta: "",
                                                      borough: borough)
        
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows.count, 6)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[0].title, Constants.neighborhoodAreaTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[0].value, neighborhood)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[1].title, Constants.boroughTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[1].value, boro)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[2].title, Constants.boroughAreaTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[2].value, borough)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[3].title, Constants.campusNameTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[3].value, campusName)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[4].title, Constants.buildingCodeTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[4].value, buildingCode)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[5].title, Constants.communityBoardTitle)
        XCTAssertEqual(fakeNeighborhoodDetails.valueRows[5].value, communityBoard)
    }
}
