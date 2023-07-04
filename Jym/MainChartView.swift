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
    let dateSize: CGFloat = 15
    @Binding var sampleWorkoutDays: [WorkoutDay]
    let sampleSets = Sets.sampleData
    
    var body: some View {
        NavigationView {
            List {
                VStack {
                    HStack {
                        Text(Date.now, style: .date)
                            .font(.system(size: dateSize))
                            .foregroundColor(Color.gray)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Text("Charts")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .bold()
                        Spacer()
                    }
                }
                .listRowInsets(EdgeInsets())
                .listRowBackground(
                    Color("royalBlue")
                )
                Section(header: Text("Activity Report")) {
                    Chart {
                        ForEach(sampleSets) { sets in
                            BarMark(x: .value("Date", sets.date, unit: .day), y: .value("Count", sets.setCount))
                        }
                    }
                    .listRowInsets(EdgeInsets())
                    .listRowBackground(
                        Color("royalBlue")
                    )
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
                    .foregroundStyle(
                        .linearGradient(
                            Gradient(colors:[Color("angelYellow").opacity(0.9), Color.red.opacity(0.7)]),
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
                .headerProminence(.increased)
                Section(header: Text("See how you're improving")) {
                    ForEach($sampleWorkoutDays) { $workoutDay in
                        NavigationLink {
                            WorkoutChartView(workoutDay: $workoutDay)
                        } label: {
                            CardView(workoutDay: $workoutDay)
                        }
                        .listRowSeparatorTint(.yellow)
                        .foregroundColor(Color("gold"))
                        .listRowBackground(
                            Color("royalBlueLight")
                        )
                    }
                }
                .headerProminence(.increased)
            }
            .padding(.top, -35)
            .foregroundColor(.white)
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button{
                        print("hi")
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .background(Color("royalBlue"))
            .toolbarBackground(Color("royalBlue"), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

struct MainChartView_Previews: PreviewProvider {
    static var previews: some View {
        MainChartView(sampleWorkoutDays: .constant(WorkoutDay.sampleData))
    }
}
