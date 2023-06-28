//
//  MainChartView.swift
//  Jym
//
//  Created by John Smith on 5/25/23.
//

import SwiftUI
import Charts

struct MainChartView: View {
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let backTextColor = Color.white
    let subtitleSize: CGFloat = 20
    let cornerRadius: CGFloat = 10
    let outlineSize: CGFloat = 1
    @Binding var sampleWorkoutDays: [WorkoutDay]
    let sampleSets = Sets.sampleData
    
    var body: some View {
        let spacing: CGFloat = width*0.05
        let columns = [
            GridItem(.flexible(), spacing: spacing),
            GridItem(.flexible(), spacing: spacing)
        ]
        NavigationView {
            ScrollView {
                HStack {
                    Text("Charts")
                        .foregroundColor(backTextColor)
                        .font(.system(size: 30))
                        .bold()
                    Spacer()
                }
                .padding([.bottom])
                HStack {
                    Text("Activity Report")
                        .bold()
                        .foregroundColor(backTextColor)
                        .font(.system(size: subtitleSize))
                    Spacer()
                }
                Chart {
                    ForEach(sampleSets) { sets in
                        BarMark(x: .value("Date", sets.date, unit: .day), y: .value("Count", sets.setCount))
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
                        if let sets = value.as(Int.self) {
                            AxisValueLabel {
                                Text(String(sets))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                }
                .foregroundColor(Color("gold"))
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .strokeBorder(Color("angelYellow"), lineWidth: outlineSize)
                )
                HStack {
                    Text("See How You're Improving")
                        .padding([.top], width*0.05)
                        .bold()
                        .foregroundColor(backTextColor)
                        .font(.system(size: subtitleSize))
                    Spacer()
                }
                LazyVGrid(columns: columns, spacing: spacing) {
                    ForEach($sampleWorkoutDays) { $workoutDay in
                        NavigationLink {
                            VStack {
                                WorkoutChartView(workoutDay: $workoutDay)
                            }
                            .navigationTitle($workoutDay.name)
                        } label: {
                            CardView(workoutDay: $workoutDay)
                        }
                        
                    }
                }
                Spacer()
            }
            .scrollIndicators(.hidden)
            .padding([.leading, .trailing], width*0.05)
            .background(Color("royalBlue"))
            .toolbarBackground(Color("royalBlue"), for: .navigationBar)
        }
    }
}

struct MainChartView_Previews: PreviewProvider {
    static var previews: some View {
        MainChartView(sampleWorkoutDays: .constant(WorkoutDay.sampleData))
    }
}
