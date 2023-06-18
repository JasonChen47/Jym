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
    @Binding var sampleWorkoutDays: [WorkoutDay]
    let sampleSets = Sets.sampleData
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    Text("Charts")
                        .font(.system(size: 37))
                        .bold()
                    Spacer()
                }
                .padding([.bottom])
                HStack {
                    Text("This past month:")
                        .bold()
                    Spacer()
                }
                Chart {
                    ForEach(sampleSets) { sets in
                        BarMark(x: .value("Date", sets.date, unit: .day), y: .value("Count", sets.setCount))
                    }
                }
                .aspectRatio(1.618, contentMode: .fill)
                .chartXAxis {
                    AxisMarks(values: .stride(by: .day))
                }
                HStack {
                    Text("See how you're improving: ")
                        .padding([.top], width*0.05)
                        .bold()
                    Spacer()
                }
                LazyVGrid(columns: columns) {
                    ForEach($sampleWorkoutDays) { $workoutDay in
                        NavigationLink {
                            VStack {
                                WorkoutChartView(workoutDay: $workoutDay)
                                
                            }
                            .navigationTitle($workoutDay.name)
                        } label: {
                            Color.black
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(5)
                                .overlay(
                                    VStack {
                                        HStack {
                                            Text(workoutDay.name)
                                                .foregroundColor(.white)
                                                .bold()
                                            Spacer()
                                        }
                                        .padding([.leading, .top])
                                        ZStack {
                                            Circle()
                                                .foregroundColor(.white)
                                                .frame(width: width*0.25, height: width*0.25, alignment: .center)
                                                .opacity(0.1)
                                            Text(workoutDay.emoji)
                                                .font(.system(size: 70))
                                        }
                                        Spacer()
                                    }
                                )
                        }
                        
                    }
                }
                Spacer()
            }
            .scrollIndicators(.hidden)
            .padding([.leading, .trailing], width*0.05)
        }
        
    }
}

struct MainChartView_Previews: PreviewProvider {
    static var previews: some View {
        MainChartView(sampleWorkoutDays: .constant(WorkoutDay.sampleData))
    }
}
