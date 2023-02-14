//
//  School.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//
import Foundation

struct School: Codable, Identifiable, Equatable {
    var id = UUID()
    let dbn: String
    let schoolName: String
    let primaryAddressLine: String
    let city: String
    let stateCode: String
    let zipCode: String
    let location: String
    let latitude: String?
    let longitude: String?
    let boro: String
    let overviewParagraph: String
    let schoolTenthSeats: String?
    let academicOpportunities1: String?
    let academicOpportunities2: String?
    let academicOpportunities3: String?
    let academicOpportunities4: String?
    let academicOpportunities5: String?
    let languageClasses: String?
    let neighborhood: String
    let buildingCode: String?
    let phoneNumber: String
    let faxNumber: String?
    let schoolEmail: String?
    let website: String
    let subway: String
    let bus: String
    let totalStudents: String
    let extracurricularActivities: String?
    let schoolSports: String?
    let attendanceRate: String
    let pctStuEnoughVariety: String?
    let pctStuSafe: String?
    let schoolAccessibilityDescription : String?
    let requirement1: String?
    let requirement2: String?
    let requirement3: String?
    let requirement4: String?
    let requirement5: String?
    let seats9Ge1: String?
    let grade9GeFilledFlag1: String?
    let grade9GeApplicants1: String?
    let seats9Swd1: String?
    let grade9SwdFilledFlag1: String?
    let grade9SwdApplicants1: String?
    let admissionsPriority11: String?
    let admissionsPriority21: String?
    let admissionsPriority31: String?
    let communityBoard: String?
    let councilDistrict: String?
    let censusTract: String?
    let bin: String?
    let bbl: String?
    let nta: String?
    let borough: String?
    let graduationRate: String?
    let collegeCareerRate: String?
    let girls: String?
    let boys: String?
    let pbat: String?
    let international: String?
    let specialized: String?
    let transfer: String?
    let ptech: String?
    let earlyCollege: String?
    let geoEligibility: String?
    let advancedPlacementCourses: String?
    let campusName: String?
    let psalSportsBoys: String?
    let psalSportsGirls: String?
    let psalSportsCoed: String?
    let eligibility: String?
    
    private enum CodingKeys: String, CodingKey {
        case dbn, boro, neighborhood, location, website, subway, bus, city, latitude, longitude, bin, bbl, nta, borough, ptech, transfer, specialized, international, pbat, boys, girls
        case zipCode = "zip"
        case schoolName = "school_name"
        case overviewParagraph = "overview_paragraph"
        case schoolTenthSeats = "school_10th_seats"
        case academicOpportunities1 = "academicopportunities1"
        case academicOpportunities2 = "academicopportunities2"
        case academicOpportunities3 = "academicopportunities3"
        case academicOpportunities4 = "academicopportunities4"
        case academicOpportunities5 = "academicopportunities5"
        case languageClasses = "language_classes"
        case buildingCode = "building_code"
        case phoneNumber = "phone_number"
        case faxNumber = "fax_number"
        case schoolEmail = "school_email"
        case totalStudents = "total_students"
        case extracurricularActivities = "extracurricular_activities"
        case schoolSports = "school_sports"
        case attendanceRate = "attendance_rate"
        case pctStuEnoughVariety = "pct_stu_enough_variety"
        case pctStuSafe = "pct_stu_safe"
        case schoolAccessibilityDescription = "school_accessibility_description"
        case requirement1 = "requirement1_1"
        case requirement2 = "requirement2_1"
        case requirement3 = "requirement3_1"
        case requirement4 = "requirement4_1"
        case requirement5 = "requirement5_1"
        case seats9Ge1 = "seats9ge1"
        case grade9GeFilledFlag1 = "grade9gefilledflag1"
        case grade9GeApplicants1 = "grade9geapplicants1"
        case seats9Swd1 = "seats9swd1"
        case grade9SwdFilledFlag1 = "grade9swdfilledflag1"
        case grade9SwdApplicants1 = "grade9swdapplicants1"
        case admissionsPriority11 = "admissionspriority11"
        case admissionsPriority21 = "admissionspriority21"
        case admissionsPriority31 = "admissionspriority31"
        case primaryAddressLine = "primary_address_line_1"
        case stateCode = "state_code"
        case communityBoard = "community_board"
        case councilDistrict = "council_district"
        case censusTract = "census_tract"
        case graduationRate = "graduation_rate"
        case collegeCareerRate = "college_career_rate"
        case earlyCollege = "earlycollege"
        case geoEligibility = "geoeligibility"
        case advancedPlacementCourses = "advancedplacement_courses"
        case campusName = "campus_name"
        case psalSportsBoys = "psal_sports_boys"
        case psalSportsGirls = "psal_sports_girls"
        case psalSportsCoed = "psal_sports_coed"
        case eligibility = "eligibility1"
    }
}

// Adding similar strings to an array & formatted with bullet points
extension School {
    var academicOpportunitiesCollection: [String?] {
        return [academicOpportunities1, academicOpportunities2, academicOpportunities3, academicOpportunities4, academicOpportunities5]
    }
    
    var admissionPrioritiesCollection: [String?] {
        return [admissionsPriority11, admissionsPriority21, admissionsPriority31]
    }
    
    var requirementsCollection: [String?] {
        return [requirement1, requirement2, requirement3, requirement4, requirement5]
    }
    
    func admissionPrioritiesText() -> String {
        let filteredText = admissionPrioritiesCollection.compactMap { $0 }.filter { !$0.isEmpty }
        return filteredText.formatStringWithBullet()
    }
    
    func academicOpportunitiesText() -> String {
        let filteredText = academicOpportunitiesCollection.compactMap { $0 }.filter { !$0.isEmpty }
        return filteredText.formatStringWithBullet()
    }
    
    func requirementsText() -> String {
        let filteredText = requirementsCollection.compactMap { $0 }.filter { !$0.isEmpty }
        return filteredText.formatStringWithBullet()
    }
}

extension Array where Element == String {
    func formatStringWithBullet() -> String {
        var text = ""
        
        for (index, element) in enumerated() {
            text += "• " + element
            if index < count - 1 {
                text += "\n"
            }
        }
        return text
    }
}
