//
//  Constants.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Foundation
import UIKit
import SwiftUI

struct Constants {
    
    // URLs
    static let dataUrl = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json")
    static let satScoreDataUrl = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json")
    
    // Image names
    static let schoolIcon = "building.columns"
    static let bookIcon = "magazine"
    static let graduationCapIcon = "graduationcap"
    static let forwardArrowIcon = "arrowshape.turn.up.forward"
    static let shareIcon = "square.and.arrow.up"
    
    // Constraints spacing/padding
    static let cornerRadius: CGFloat = 10
    static let separatorInsetMargin: CGFloat = 16
    static let seperatorInsetSideMargin: CGFloat = 5
    static let stackViewMargin: CGFloat = 16
    
    // TableViewCell identifiers
    static let overviewInfoTableViewCellIdentifier = "overviewInfoTableViewCellIdentifier"
    static let programDetailsTableViewCellIdentifier = "programDetailsTableViewCellIdentifier"
    static let statisticsTableViewCellIdentifier = "statisticsTableViewCellIdentifier"
    static let tableViewCellIdentifier = "tableViewCellIdentifier"
    
    // Accessibility identifiers
    static let tableViewIdentifier = "tableView"
    static let searchBarIdentifier = "searchBar"
    static let mapViewIdentifier = "mapView"
    static let segmentedControlIdentifier = "segmentedControl"
    static let iconImageIdentifier = "iconImage"
    static let overviewTextLabelIdentifier = "overviewTextLabel"
    static let titleLabelIdentifier = "titleLabel"
    static let languageClassesLabelIdentifier = "languageClassesLabel"
    static let languageClassesTextLabelIdentifier = "languageClassesTextLabel"
    static let advancedPlacementCoursesTitleLabelIdentifier = "advancedPlacementCoursesTitleLabel"
    static let advancedPlacementCoursesTextLabelIdentifier = "advancedPlacementCoursesTextLabel"
    static let eligibilityTitleLabelIdentifier = "eligibilityTitleLabel"
    static let eligibilityTextLabelIdentifier = "eligibilityTextLabel"
    static let graduationRateTitleLabelIdentifier = "graduationRateTitleLabel"
    static let graduationRateTextLabelIdentifier = "graduationRateTextLabel"
    static let collegeCareerRateTitleLabelIdentifier = "collegeCareerRateTitleLabel"
    static let collegeCareerRateTextLabelIdentifier = "collegeCareerRateTextLabel"
    static let stackViewIdentifier = "stackView"
    static let languageClassesStackViewIdentifier = "languageClassesStackView"
    static let advancedPlacementCoursesStackViewIdentifier = "advancedPlacementCoursesStackView"
    static let eligibilityStackViewIdentifier = "eligibilityStackView"
    static let graduationRateStackViewIdentifier = "graduationRateStackView"
    static let collegeCareerRateTextStackViewIdentifier = "collegeCareerRateTextStackView"
    static let ratesStackViewIdentifier = "ratesStackView"
    
    // Heights
    static let iconHeight: CGFloat = 70
    static let sectionHeaderHeight: CGFloat = 36
    
    // Font
    static let fontName = "Chalkduster"
    static let extraSmallFontSize: CGFloat = 13
    static let smallFontSize: CGFloat = 15
    static let mediumFontSize: CGFloat = 25
    static let largeFontSize: CGFloat = 50
    
    // Strings: View titles
    static let schoolsListTitle = NSLocalizedString("NYC Schools Directory", comment: "nyc schools directory")
    static let placeholder = NSLocalizedString(" Search School Name", comment: "searchbar placeholder")
    static let graduationRate = NSLocalizedString("Graduation\nRate", comment: "attendance rate")
    static let collegeCareerRate = NSLocalizedString("College Career\nRate", comment: "college career rate")
    static let satScoresTitle = NSLocalizedString("SAT Score Details", comment: "sat score details")
    static let requirementsDetailsTitle = NSLocalizedString("Admission Details", comment: "admission details")
    static let statisticsTitle = NSLocalizedString("Statistics", comment: "statistics")
    static let contactDetailsTitle = NSLocalizedString("Contact Details", comment: "contact details")
    static let facilityTitle = NSLocalizedString("Facility Details", comment: "facility details")
    static let detailsTitle = NSLocalizedString("Details", comment: "details")
    static let readMore = NSLocalizedString("Read more", comment: "read more")
    static let showLess = NSLocalizedString("Show less", comment: "show less")
    
    // Strings: DetailsViewController titles
    static let overviewTitle = NSLocalizedString("Overview", comment: "overview")
    static let programDetailsTitle = NSLocalizedString("Program Details", comment: "program details")
    
    static let viewLocationDetailsTitle = NSLocalizedString("View Location Details", comment: "view location details")
    static let viewContactDetailsTitle = NSLocalizedString("View Contact Details", comment: "view contact details")
    static let viewAdmissionDetailsTitle = NSLocalizedString("View Admission Details", comment: "view admissions details")
    static let viewSATDetailsTitle = NSLocalizedString("View SAT Score Details", comment: "view sat details")
    static let viewFacilityDetailsTitle = NSLocalizedString("View Facility Details", comment: "view facility details")
    static let viewStatisticsTitle = NSLocalizedString("View Statistics", comment: "view statistics")
    
    // Strings: LocationsViewController titles
    static let addressTitle = NSLocalizedString("Address", comment: "address")
    static let neighborhoodDetailsTitle = NSLocalizedString("Neighborhood Details", comment: "neighborhood details")
    static let transportationOptionsTitle = NSLocalizedString("Transportation Options", comment: "transportation options")
    static let mapTitle = NSLocalizedString("Map", comment: "map")
    static let targetLocation = NSLocalizedString("Target location", comment: "target location")
    
    // Strings: FacilitiesViewController titles
    static let sportsTitle = NSLocalizedString("Sports", comment: "sports")
    static let extracurricularActivitiesTitle = NSLocalizedString("Extracurricular Activities", comment: "extracurricular activities")
    
    // Strings: SATScoreViewController titles
    static let satTotalParticipantsTitle = NSLocalizedString("Number of SAT test takers", comment: "number of sat test takers")
    static let mathScoreTitle = NSLocalizedString("SAT Math Average Score", comment: "sat math average score")
    static let writingScoreTitle = NSLocalizedString("SAT Writing Average Score", comment: "sat writing average score")
    static let criticalReadingScoreTitle = NSLocalizedString("SAT Critical Reading Average Score", comment: "sat critical reading average score")
    static let barChartTitle = NSLocalizedString("SAT Bar Chart", comment: "sat bar chart")
    static let criticalReadingAvgTitle = NSLocalizedString("Critical Reading Avg", comment: "critical reading avg")
    static let writingAvgTitle = NSLocalizedString("Writing Avg", comment: "writing avg")
    static let mathAvgTitle = NSLocalizedString("Math Avg", comment: "math avg")
    static let values = NSLocalizedString("Values", comment: "values")
    static let totalCount = NSLocalizedString("Total Count", comment: "total count")
    static let type = NSLocalizedString("ype", comment: "type")
    static let color = NSLocalizedString("Color", comment: "color")
    
    // Strings: NeighborhoodDetails titles
    static let neighborhoodAreaTitle = NSLocalizedString("Neighborhood Area: ", comment: "neighborhood area")
    static let boroughTitle = NSLocalizedString("Borough: ", comment: "borough")
    static let boroughAreaTitle = NSLocalizedString("Borough Area: ", comment: "borough area")
    static let campusNameTitle = NSLocalizedString("Campus Name: ", comment: "campus name")
    static let buildingCodeTitle = NSLocalizedString("Building Code: ", comment: "building code")
    static let communityDistrictTitle = NSLocalizedString("Community District: ", comment: "community district")
    static let communityBoardTitle = NSLocalizedString("Community Board: ", comment: "community board")
    static let councilDistrictTitle = NSLocalizedString("Council District: ", comment: "council district")
    static let censusTractTitle = NSLocalizedString("Census Tract: ", comment: "census tract")
    static let buildingIdentificationTitle = NSLocalizedString("Building Identification: ", comment: "building identification")
    static let boroughBuildingLotNumberTitle = NSLocalizedString("Borough building lot number: ", comment: "norough building lot number")
    static let neighborhoodTabulationAreaTitle = NSLocalizedString("Neighborhood Tabulation Area: ", comment: "neighborhood tabulation area")
    
    // Strings: Transportation Options
    static let subwayTitle = NSLocalizedString("Subway: ", comment: "subway")
    static let busTitle = NSLocalizedString("Bus: ", comment: "bus")
    
    // Strings: ContactDetails titles
    static let phoneNumberTitle = NSLocalizedString("Phone Number", comment: "phone number")
    static let faxNumberTitle = NSLocalizedString("Fax Number", comment: "fax number")
    static let schoolEmailTitle = NSLocalizedString("School Email", comment: "school email")
    static let websiteTitle = NSLocalizedString("Website", comment: "website")
    
    // Strings: ProgramsOverview
    static let eligibilityTitle = NSLocalizedString("Eligibility: ", comment: "eligibility")
    static let servingSchoolGradesTitle = NSLocalizedString("Serving school grades: ", comment: "serving school grades")
    static let apCoursesTitle = NSLocalizedString("AP courses:  ", comment: "ap courses")
    static let languageClassesTitle = NSLocalizedString("Language classes: ", comment: "language classes")
    
    // Strings: Admissions titles
    static let requirementsTitle = NSLocalizedString("Requirements", comment: "requirements")
    static let admissionPrioritiesTitle = NSLocalizedString("Admission Priorities", comment: "admission priorities")
    static let academicOpportunitiesTitle = NSLocalizedString("Academic Opportunities", comment: "academic opportunities")
    
    // Strings: Facilities titles
    static let offerTenthGradeSeatsTitle = NSLocalizedString("Offer 10th grade seats: ", comment: "offer 10th grade seats")
    static let schoolSiteAccessibleTitle = NSLocalizedString("School site accessible: ", comment: "school site accessible")
    static let femaleOnlySchoolTitle = NSLocalizedString("Female only school: ", comment: "female only school")
    static let maleOnlySchoolTitle = NSLocalizedString("Male only school: ", comment: "male only school")
    static let pbatSupportedTitle = NSLocalizedString("PBAT supported: ", comment: "pbat supported")
    static let ptechSupportedTitle = NSLocalizedString("PTECH: ", comment: "ptech supported")
    static let internationalTitle = NSLocalizedString("Accepts international students: ", comment: "accepts international students")
    static let specializedTitle = NSLocalizedString("Specialized: ", comment: "specialized")
    static let transferTitle = NSLocalizedString("Accepts transfer students: ", comment: "accepts transfer students")
    static let earlyCollegeTitle = NSLocalizedString("Early college option: ", comment: "early college option")
    static let geographicEligibilityTitle = NSLocalizedString("Geographic Eligibility: ", comment: "geographic eligibility")
    static let sportsFacilitiesTitle = NSLocalizedString("Sports: ", comment: "sports")
    static let extraCurricularFacilitiesTitle = NSLocalizedString("Extra Curricular Activities: ", comment: "extra curricular activities")
    
    // Strings: StatisticsInfo titles
    static let attendanceRateTitle = NSLocalizedString("Attendance Rate: ", comment: "attendance rate")
    static let enoughVarietyProgramsTitle = NSLocalizedString("Students felt enough variety of programs: ", comment: "students felt enough variety of programs")
    static let safetyTitle = NSLocalizedString("Students felt safe on school premise: ", comment: "students felt safe on school premise")
    static let totalStudentsTitle = NSLocalizedString("Total number of students: ", comment: "total number of students")
    static let numberOfAvailableNinthGradeSeatsTitle = NSLocalizedString("Number of available 9th grade seats: ", comment: "number of available 9th grade seats")
    static let numberOfAvailableNinthGradeSeatsDisabledTitle = NSLocalizedString("number of available 9th grade seats (students with disabilities): ", comment: "Number of available 9th grade seats (students with disabilities)")
    static let numberOfApplicantsNinthGradeSeatsTitle = NSLocalizedString("Number of applicants for 9th grade seats: ", comment: "number of applicants for 9th grade seats")
    static let numberOfApplicantsNinthGradeSeatsDisabledTitle = NSLocalizedString("Number of applicants for 9th grade seats (students with disabilities): ", comment: "number of applicants for 9th grade seats (students with disabilities)")
    static let filledSeatsForNinthGradeProgramTitle = NSLocalizedString("Filled seats for 9th grade for first program: ", comment: "filled seats for 9th grade for first program")
    static let filledSeatsForNinthGradeProgramDisabledTitle = NSLocalizedString("Filled seats for 9th grade for first program (students with disabilities): ", comment: "filled seats for 9th grade for first program (students with disabilities)")
    
    // Strings: Alert related
    static let rowSelectionFailureMessage = NSLocalizedString("Unable to select row due to no SAT score associated. Please try again later.", comment: "row selection failure message")
    static let locationServicePromptMessage = NSLocalizedString("For best results, let your device turn on location service.", comment: "sor best results, let your device turn on location service.")
    static let ok = NSLocalizedString("Ok", comment: "ok")
    static let cancel = NSLocalizedString("Cancel", comment: "cancel")
    
    // Strings: Log messages
    static let noSchoolsFound = NSLocalizedString("No Schools found!", comment: "no schools found")
    static let noSATScoresFound = NSLocalizedString("No SAT Scores found!", comment: "no sat scores found")
    
    // Strings: Accessibility
    static let tapToViewDetails = NSLocalizedString("Double tap to view details", comment: "accessibility hint for tableViewCell")
    static let bookIconImage = NSLocalizedString("Book icon image", comment: "accessibility label for icon image")
    static let graduationCapIconImage = NSLocalizedString("Graduation cap icon image", comment: "accessibility label for icon image")
    static let schoolIconImage = NSLocalizedString("School icon image", comment: "accessibility label for icon image")
    static let graduationRateAccessibilityTitle = NSLocalizedString(", graduation rate: ", comment: "accessibility label for graduation rate title")
    static let collegeCareerRateAccessibilityTitle = NSLocalizedString(", college career rate: ", comment: "accessibility label for college career rate title")
    static let titleAccessibilityTitle = NSLocalizedString(", title: ", comment: "accessibility label for title")
    static let descriptionAccessibilityTitle = NSLocalizedString(", description: ", comment: "accessibility label for description")
    static let shareDetailsAccessibilityLabel = NSLocalizedString("Share Details", comment: "accessibility label for share contact details")
    static let shareDetailsAccessibilityHint = NSLocalizedString("Tap to share contact details", comment: "accessibility hint for share details button")
    static let shareDirectionAccessibilityLabel = NSLocalizedString("Share Directions", comment: "accessibility label for share directions")
    static let shareDirectionAccessibilityHint = NSLocalizedString("Tap to share directions", comment: "accessibility hint for share directions button")
}
