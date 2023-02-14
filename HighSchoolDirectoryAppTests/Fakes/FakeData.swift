//
//  File.swift
//  HighSchoolDirectoryAppTests
//
//  Created by sokolli on 2/14/23.
//

import Foundation

let fakeSchool = School(dbn: "02M260",
                    schoolName: "Clinton School Writers & Artists, M.S. 260",
                    primaryAddressLine: "10 East 15th Street",
                    city: "Manhattan",
                    stateCode: "NY",
                    zipCode: "10003",
                    location: "10 East 15th Street, Manhattan NY 10003 (40.736526, -73.992727)",
                    latitude: "40.73653",
                    longitude: "-73.9927",
                    boro: "M",
                    overviewParagraph: "Students who are prepared for college must have an education that encourages them to take risks as they produce and perform. Our college preparatory curriculum develops writers and has built a tight-knit community. Our school develops students who can think analytically and write creatively. Our arts programming builds on our 25 years of experience in visual, performing arts and music on a middle school level. We partner with New Audience and the Whitney Museum as cultural partners. We are a International Baccalaureate (IB) candidate school that offers opportunities to take college courses at neighboring universities.",
                    schoolTenthSeats: "1",
                    academicOpportunities1: "Free college courses at neighboring universities",
                    academicOpportunities2: "International Travel, Special Arts Programs, Music, Internships, College Mentoring English Language Learner Programs: English as a New Language",
                    academicOpportunities3: "",
                    academicOpportunities4: "",
                    academicOpportunities5: "",
                    languageClasses: "French, Spanish",
                    neighborhood: "Chelsea-Union Sq",
                    buildingCode: "M868",
                    phoneNumber: "212-524-4360",
                    faxNumber: "212-524-4365",
                    schoolEmail: "admissions@theclintonschool.net",
                    website: "www.theclintonschool.net",
                    subway: "1, 2, 3, F, M to 14th St - 6th Ave; 4, 5, L, Q to 14th St-Union Square; 6, N, R to 23rd St",
                    bus: "BM1, BM2, BM3, BM4, BxM10, BxM6, BxM7, BxM8, BxM9, M1, M101, M102, M103, M14A, M14D, M15, M15-SBS, M2, M20, M23, M3, M5, M7, M8, QM21, X1, X10, X10B, X12, X14, X17, X2, X27, X28, X37, X38, X42, X5, X63, X64, X68, X7, X9",
                    totalStudents: "376",
                    extracurricularActivities: "CUNY College Now, Technology, Model UN, Student Government, School Leadership Team, Music, School Musical, National Honor Society, The Clinton Post (School Newspaper), Clinton Soup (Literary Magazine), GLSEN, Glee",
                    schoolSports: "Cross Country, Track and Field, Soccer, Flag Football, Basketball",
                    attendanceRate: "0.970000029",
                    pctStuEnoughVariety: "0.899999976",
                    pctStuSafe: "0.970000029",
                    schoolAccessibilityDescription: "1",
                    requirement1: "Course Grades: English (87-100), Math (83-100), Social Studies (90-100), Science (88-100)",
                    requirement2: "Standardized Test Scores: English Language Arts (2.8-4.5), Math (2.8-4.5)",
                    requirement3: "Attendance and Punctuality",
                    requirement4: "Writing Exercise",
                    requirement5: "Group Interview (On-Site)",
                    seats9Ge1: "80",
                    grade9GeFilledFlag1: "Y",
                    grade9GeApplicants1: "1515",
                    seats9Swd1: "16",
                    grade9SwdFilledFlag1: "Y",
                    grade9SwdApplicants1: "138",
                    admissionsPriority11: "Priority to continuing 8th graders",
                    admissionsPriority21: "Then to Manhattan students or residents",
                    admissionsPriority31: "Then to New York City residents",
                    communityBoard: "5",
                    councilDistrict: "2",
                    censusTract: "52",
                    bin: "1089902",
                    bbl: "1008420034",
                    nta: "Hudson Yards-Chelsea-Flatiron-Union Square",
                    borough: "MANHATTAN",
                    graduationRate: "0.612999976",
                    collegeCareerRate: "0.486000001",
                    girls: "1",
                    boys: "1",
                    pbat: "1",
                    international: "1",
                    specialized: "1",
                    transfer: "1",
                    ptech: "1",
                    earlyCollege: "1",
                    geoEligibility: "Open only to Bronx students/residents",
                    advancedPlacementCourses: "AP Calculus, AP English, AP Spanish, AP Studio Art, AP US Government and Politics",
                    campusName: "Prospect Heights Educational Campus",
                    psalSportsBoys: "Baseball, Basketball, Bowling, Cross Country, Outdoor Track, Soccer, Tennis, Volleyball, Wrestling",
                    psalSportsGirls: "Basketball, Cross Country, Handball, Indoor Track, Outdoor Track, Soccer, Softball, Tennis, Volleyball",
                    psalSportsCoed: "Cricket, Double Dutch",
                    eligibility: "For Current 8th Grade St…l for at least one year")

var fakeSatScore = SATScore(dbn: "02M260",
                            schoolName: "Clinton School Writers & Artists, M.S. 260",
                            numOfSatTestTakers: "300",
                            satCriticalReadingAvgScore: "320",
                            satMathAvgScore: "330",
                            satWritingAvgScore: "340")
var fakeSchoolData = SchoolData(school: fakeSchool, satScore: fakeSatScore)

var fakeGeneralDetails = GeneralDetails(overview: fakeSchool.overviewParagraph,
                                        schoolName: fakeSchool.schoolName)

var fakeContactDetails = ContactDetails(phoneNumber: fakeSchool.phoneNumber,
                                        faxNumber: fakeSchool.faxNumber,
                                        schoolEmail: fakeSchool.schoolEmail,
                                        website: fakeSchool.website)

var fakeAddress = Address(schoolName: fakeSchool.schoolName,
                          primaryAddressLine: fakeSchool.primaryAddressLine,
                          city: fakeSchool.city,
                          stateCode: fakeSchool.stateCode,
                          zipCode: fakeSchool.zipCode,
                          location: fakeSchool.location,
                          latitude: fakeSchool.latitude,
                          longitude: fakeSchool.longitude)

var fakeTransportationOptions = TransportationOptions(subway: fakeSchool.subway,
                                                      bus: fakeSchool.bus)

var fakeNeighborhoodDetails = NeighborhoodDetails(campusName: fakeSchool.campusName,
                                                  boro: fakeSchool.boro,
                                                  neighborhood: fakeSchool.neighborhood,
                                                  buildingCode: fakeSchool.buildingCode,
                                                  communityBoard: fakeSchool.communityBoard,
                                                  councilDistrict: fakeSchool.councilDistrict,
                                                  censusTract: fakeSchool.censusTract,
                                                  bin: fakeSchool.bin,
                                                  bbl: fakeSchool.bbl,
                                                  nta: fakeSchool.nta,
                                                  borough: fakeSchool.borough)

var fakeLocationDetails = LocationDetails(address: fakeAddress,
                                          transportationOptions: fakeTransportationOptions,
                                          neighborhoodDetails: fakeNeighborhoodDetails)

var fakeStatisticsOverview = StatisticsOverview(collegeCareerRate: fakeSchool.collegeCareerRate!,
                                                graduationRate: fakeSchool.graduationRate!)

var fakeStatisticsInfo = StatisticsInfo(pctStuEnoughVariety: fakeSchool.pctStuEnoughVariety,
                                        totalStudents: fakeSchool.totalStudents,
                                        pctStuSafe: fakeSchool.pctStuSafe,
                                        seats9Ge1: fakeSchool.seats9Ge1,
                                        grade9GeFilledFlag1: fakeSchool.grade9GeFilledFlag1,
                                        grade9GeApplicants1: fakeSchool.grade9GeApplicants1,
                                        seats9Swd1: fakeSchool.seats9Swd1,
                                        grade9SwdFilledFlag1: fakeSchool.grade9SwdFilledFlag1,
                                        grade9SwdApplicants1: fakeSchool.grade9SwdApplicants1,
                                        attendanceRate: fakeSchool.attendanceRate)

var fakeStatistics = Statistics(statisticsOverview: fakeStatisticsOverview,
                                statisticsInfo: fakeStatisticsInfo)

var fakeProgramOverview = ProgramOverview(eligibility: fakeSchool.eligibility,
                                          advancedPlacementCourses: fakeSchool.advancedPlacementCourses,
                                          languageClasses: fakeSchool.languageClasses)

var fakeFacilities = Facilities(schoolTenthSeats: fakeSchool.schoolTenthSeats,
                                schoolAccessibilityDescription: fakeSchool.schoolAccessibilityDescription,
                                girls: fakeSchool.girls,
                                boys: fakeSchool.boys,
                                pbat: fakeSchool.pbat,
                                international: fakeSchool.international,
                                specialized: fakeSchool.specialized,
                                transfer: fakeSchool.transfer,
                                ptech: fakeSchool.ptech,
                                earlyCollege: fakeSchool.earlyCollege,
                                geoEligibility: fakeSchool.geoEligibility,
                                psalSportsBoys: fakeSchool.psalSportsBoys,
                                psalSportsGirls: fakeSchool.psalSportsGirls,
                                psalSportsCoed: fakeSchool.psalSportsCoed,
                                schoolSports: fakeSchool.schoolSports,
                                extracurricularActivities: fakeSchool.extracurricularActivities)

var fakeAdmissions = Admissions(requirements: fakeSchool.requirementsText(),
                               admissionsPriorities: fakeSchool.admissionPrioritiesText(),
                               academicOpportunities: fakeSchool.academicOpportunitiesText())

var fakeProgramDetails = ProgramDetails(programOverview: fakeProgramOverview,
                                        facilities: fakeFacilities,
                                        admissions: fakeAdmissions,
                                        satScore: fakeSatScore)
