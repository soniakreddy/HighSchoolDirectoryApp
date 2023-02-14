//
//  TransportationOptions.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct TransportationOptions: Codable, Equatable {
    let subway: String
    let bus: String
    
    static func == (lhs: TransportationOptions, rhs: TransportationOptions) -> Bool {
        return lhs.subway == rhs.subway && lhs.bus == rhs.bus
    }
    
    // Creating an non empty array consisting of tuples to hold title & value of each row.
    var valueRows: [(title: String, value: String)] {
        var valueRows = [(title: String, value: String)]()
        valueRows.append((title: Constants.subwayTitle, value: subway))
        valueRows.append((title: Constants.busTitle, value: bus))
        return valueRows
    }
}
