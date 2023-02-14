//
//  LocationDetails.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct LocationDetails: Equatable {
    let address: Address
    let transportationOptions: TransportationOptions
    let neighborhoodDetails: NeighborhoodDetails
    
    static func == (lhs: LocationDetails, rhs: LocationDetails) -> Bool {
        return lhs.address == rhs.address && lhs.transportationOptions == rhs.transportationOptions && lhs.neighborhoodDetails == rhs.neighborhoodDetails
    }
}
