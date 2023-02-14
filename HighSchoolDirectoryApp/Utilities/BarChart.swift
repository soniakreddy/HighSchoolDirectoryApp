//
//  BarChart.swift
//  HighSchoolDirectoryApp
//
//  Created by sokolli on 2/14/23.
//

import Charts
import Foundation
import SwiftUI

struct BarChartDataType: Identifiable {
    var color: String
    var type: String
    var count: Int
    var id = UUID()
}

struct BarChart: View {
    let stackedBarData: [BarChartDataType]
    let xMarkValues = stride(from: 0, to: 1600, by: 400).map{ $0 }

    var body: some View {
        Chart {
            ForEach(stackedBarData) { barChartDataType in
                BarMark(
                    x: .value(Constants.totalCount, barChartDataType.count),
                    y: .value(Constants.type, barChartDataType.type),
                    width: .fixed(20)
                ).foregroundStyle(by: .value(Constants.color, barChartDataType.color))
            }
        }.frame(height: 150)
        .chartXAxis(content: {
            AxisMarks(values: xMarkValues)
        })
    }
}
