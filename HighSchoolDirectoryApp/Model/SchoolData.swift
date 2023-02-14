//
//  CustomStructs.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation

struct SchoolData: Equatable {
    let school: School
    let satScore: SATScore
    
    static func == (lhs: SchoolData, rhs: SchoolData) -> Bool {
        return lhs.school == rhs.school && lhs.satScore == rhs.satScore
    }
}

struct SchoolDataContainer: Equatable {
    let generalDetails: GeneralDetails
    let locationDetails: LocationDetails
    let contactDetails: ContactDetails
    let programDetails: ProgramDetails
    let statistics: Statistics
    
    static func == (lhs: SchoolDataContainer, rhs: SchoolDataContainer) -> Bool {
        return lhs.generalDetails == rhs.generalDetails && lhs.locationDetails == rhs.locationDetails && lhs.contactDetails == rhs.contactDetails && lhs.programDetails == rhs.programDetails && lhs.statistics == rhs.statistics
    }
}

extension SchoolData {
    public func containerForSchoolData() -> SchoolDataContainer {
        let address = Address(schoolName: school.schoolName,
                              primaryAddressLine: school.primaryAddressLine,
                              city: school.city,
                              stateCode: school.stateCode,
                              zipCode: school.zipCode,
                              location: school.location,
                              latitude: school.latitude,
                              longitude: school.longitude)
        let transportationOptions = TransportationOptions(subway: school.subway,
                                                          bus: school.bus)
        let neighborhoodDetails = NeighborhoodDetails(campusName: school.campusName,
                                                      boro: school.boro,
                                                      neighborhood: school.neighborhood,
                                                      buildingCode: school.buildingCode,
                                                      communityBoard: school.communityBoard,
                                                      councilDistrict: school.councilDistrict,
                                                      censusTract: school.censusTract,
                                                      bin: school.bin,
                                                      bbl: school.bbl,
                                                      nta: school.nta,
                                                      borough: school.borough)
        let locationDetails = LocationDetails(address: address,
                                              transportationOptions: transportationOptions,
                                              neighborhoodDetails: neighborhoodDetails)
        
        let contactDetails = ContactDetails(phoneNumber: school.phoneNumber,
                                            faxNumber: school.faxNumber,
                                            schoolEmail: school.schoolEmail,
                                            website: school.website)
        
        let programOverview = ProgramOverview(eligibility: school.eligibility,
                                               advancedPlacementCourses: school.advancedPlacementCourses,
                                               languageClasses: school.languageClasses)
        let satScore = SATScore(dbn: satScore.dbn,
                            schoolName: satScore.schoolName,
                            numOfSatTestTakers: satScore.numOfSatTestTakers,
                            satCriticalReadingAvgScore: satScore.satCriticalReadingAvgScore,
                            satMathAvgScore: satScore.satMathAvgScore,
                            satWritingAvgScore: satScore.satWritingAvgScore)
        let facilities = Facilities(schoolTenthSeats: school.schoolTenthSeats,
                                    schoolAccessibilityDescription: school.schoolAccessibilityDescription,
                                    girls: school.girls,
                                    boys: school.boys,
                                    pbat: school.pbat,
                                    international: school.international,
                                    specialized: school.specialized,
                                    transfer: school.transfer,
                                    ptech: school.ptech,
                                    earlyCollege: school.earlyCollege,
                                    geoEligibility: school.geoEligibility,
                                    psalSportsBoys: school.psalSportsBoys,
                                    psalSportsGirls: school.psalSportsGirls,
                                    psalSportsCoed: school.psalSportsCoed,
                                    schoolSports: school.schoolSports,
                                    extracurricularActivities: school.extracurricularActivities)
        let admissions = Admissions(requirements: school.requirementsText(),
                                        admissionsPriorities: school.admissionPrioritiesText(),
                                    academicOpportunities: school.academicOpportunitiesText())
        let programDetails = ProgramDetails(programOverview: programOverview,
                                             facilities: facilities,
                                            admissions: admissions,
                                            satScore: satScore)
        
        let statisticsOverview = StatisticsOverview(collegeCareerRate: school.collegeCareerRate ?? "0",
                                                    graduationRate: school.graduationRate ?? "0")
        let statisticsInfo = StatisticsInfo(pctStuEnoughVariety: school.pctStuEnoughVariety ?? "0",
                                            totalStudents: school.totalStudents,
                                            pctStuSafe: school.pctStuSafe ?? "0",
                                            seats9Ge1: school.seats9Ge1,
                                            grade9GeFilledFlag1: school.grade9GeFilledFlag1,
                                            grade9GeApplicants1: school.grade9GeApplicants1,
                                            seats9Swd1: school.seats9Swd1,
                                            grade9SwdFilledFlag1: school.grade9SwdFilledFlag1,
                                            grade9SwdApplicants1: school.grade9SwdApplicants1,
                                            attendanceRate: school.attendanceRate)
        let statistics = Statistics(statisticsOverview: statisticsOverview,
                                    statisticsInfo: statisticsInfo)
        
        let generalDetails = GeneralDetails(overview: school.overviewParagraph,
                                            schoolName: school.schoolName)
        return SchoolDataContainer(generalDetails: generalDetails,
                                   locationDetails: locationDetails,
                                   contactDetails: contactDetails,
                                   programDetails: programDetails,
                                   statistics: statistics)
    }
}
