//
//  WorkoutChartView.swift
//  Jym
//
//  Created by John Smith on 6/18/23.
//

import SwiftUI
import Charts

struct WorkoutChartView: View {
    @Binding var workoutDay: WorkoutDay
    let outlineSize: CGFloat = 1
    let cornerRadius: CGFloat = 10
    var body: some View {
        ScrollView {
            HStack {
                Text(workoutDay.name)
                    .foregroundColor(.white)
                    .font(.system(size: 30))
                    .bold()
                Spacer()
            }
            .padding([.bottom])
            ForEach(workoutDay.workouts) { workout in
                VStack {
                    HStack {
                        Text(workout.name)
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                        Spacer()
                    }
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
                            Gradient(colors:[Color("angelYellow").opacity(0.9), Color("gold").opacity(0.7)]),
                            startPoint: UnitPoint(x: 0.5, y: 0),
                            endPoint: UnitPoint(x: 0.5, y: 1)
                        )
                    )
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .strokeBorder(Color("angelYellow"), lineWidth: outlineSize)
                    )
                    .background(
                        Color("royalBlueLight")
                    )
                }
                
            }
        }
        .padding()
        .background(Color("royalBlue"))
        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutChartView(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
}
