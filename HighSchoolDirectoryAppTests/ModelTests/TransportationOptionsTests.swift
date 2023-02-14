//
//  TransportationOptionsTests.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import XCTest

final class TransportationOptionsTests: XCTestCase {
    private var fakeTransportationOptions: TransportationOptions!
    private let subwayValue = "1, 2, 3, F, M to 14th St - 6th Ave; 4, 5, L, Q to 14th St-Union Square; 6, N, R to 23rd St"
    private let busValue = "BM1, BM2, BM3, BM4, BxM10, BxM6, BxM7, BxM8, BxM9"
    
    override func setUp() {
        super.setUp()
        
        fakeTransportationOptions = TransportationOptions(subway: "", bus: "")
    }
    
    func testFakeTransportationOptionsWithEmptyData() {
        XCTAssertEqual(fakeTransportationOptions.valueRows.count, 2)
        XCTAssertEqual(fakeTransportationOptions.valueRows[0].title, Constants.subwayTitle)
        XCTAssertEqual(fakeTransportationOptions.valueRows[0].value, "")
        XCTAssertEqual(fakeTransportationOptions.valueRows[1].title, Constants.busTitle)
        XCTAssertEqual(fakeTransportationOptions.valueRows[1].value, "")
    }
    
    func testFakeTransportationOptionsWithData() {
        fakeTransportationOptions = TransportationOptions(subway: subwayValue, bus: busValue)
        
        XCTAssertEqual(fakeTransportationOptions.valueRows.count, 2)
        XCTAssertEqual(fakeTransportationOptions.valueRows[0].title, Constants.subwayTitle)
        XCTAssertEqual(fakeTransportationOptions.valueRows[0].value, subwayValue)
        XCTAssertEqual(fakeTransportationOptions.valueRows[1].title, Constants.busTitle)
        XCTAssertEqual(fakeTransportationOptions.valueRows[1].value, busValue)
    }
}
