//
//  WorkoutChartView.swift
//  Jym
//
//  Created by John Smith on 7/6/23.
//

import SwiftUI
import Charts

struct WorkoutChartView: View {
    
    @Binding var workout: Workout
    
    var body: some View {
        Chart {
            ForEach(workout.records) { record in
                BarMark(x: .value("Date", record.date, unit: .day), y: .value("Count", record.weight))
            }
        }
        .chartXAxis {
            AxisMarks(values: .stride(by: .weekOfYear)) { value in
                if let date = value.as(Date.self) {
                    AxisValueLabel {
                        Text(date, format: .dateTime.month().day())
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .chartYAxis {
            AxisMarks() { value in
                if let weight = value.as(Int.self) {
                    AxisValueLabel {
                        Text(String(weight))
                            .foregroundColor(.white)
                    }
                }
            }
        }
        .foregroundStyle(
            .linearGradient(
                Gradient(colors:[Color("angelYellow").opacity(0.9), Color.red.opacity(0.7)]),
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
//        .overlay(
//            RoundedRectangle(cornerRadius: 10)
//                .strokeBorder(Color("angelYellow"), lineWidth: 1)
//        )
//        .background(
//            Color("royalBlueLight")
//        )
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            WorkoutChartView(workout: .constant(WorkoutDay.sampleData[0].workouts[0]))
        }
        .background(
            Color("royalBlue")
        )
    }
}
