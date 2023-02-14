//
//  NeighborhoodDetails.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct NeighborhoodDetails: Equatable {
    let campusName: String?
    let boro: String
    let neighborhood: String
    let buildingCode: String?
    let communityBoard: String?
    let councilDistrict: String?
    let censusTract: String?
    let bin: String?
    let bbl: String?
    let nta: String?
    let borough: String?
    
    // Creating an non empty array consisting of tuples to hold title & value of each row.
    var valueRows: [(title: String, value: String)] {
        var valueRows = [(title: String, value: String)]()
        valueRows.append((title: Constants.neighborhoodAreaTitle, value: neighborhood))
        valueRows.append((title: Constants.boroughTitle, value: boro))
        
        if let borough = borough, !borough.isEmpty {
            valueRows.append((title: Constants.boroughAreaTitle, value: borough))
        }
        
        if let campusName = campusName, !campusName.isEmpty {
            valueRows.append((title: Constants.campusNameTitle, value: campusName))
        }
        
        if let buildingCode = buildingCode, !buildingCode.isEmpty {
            valueRows.append((title: Constants.buildingCodeTitle, value: buildingCode))
        }
        
        if let communityBoard = communityBoard, !communityBoard.isEmpty {
            valueRows.append((title: Constants.communityBoardTitle, value: communityBoard))
        }
        
        if let councilDistrict = councilDistrict, !councilDistrict.isEmpty {
            valueRows.append((title: Constants.councilDistrictTitle, value: councilDistrict))
        }
        
        if let censusTract = censusTract, !censusTract.isEmpty {
            valueRows.append((title: Constants.censusTractTitle, value: censusTract))
        }
        
        if let bin = bin, !bin.isEmpty {
            valueRows.append((title: Constants.buildingIdentificationTitle, value: bin))
        }
        
        if let bbl = bbl, !bbl.isEmpty {
            valueRows.append((title: Constants.boroughBuildingLotNumberTitle, value: bbl))
        }
        
        if let nta = nta, !nta.isEmpty {
            valueRows.append((title: Constants.neighborhoodTabulationAreaTitle, value: nta))
        }
        
        return valueRows
    }
}
