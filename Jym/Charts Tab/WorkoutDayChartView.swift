//
//  WorkoutDayChartView.swift
//  Jym
//
//  Created by John Smith on 6/18/23.
//

import SwiftUI
import Charts

struct WorkoutDayChartView: View {
    
//    init(workoutDay: Binding<WorkoutDay>) {
//        
//        Utils.navigationBarConfig()
//        self._workoutDay = workoutDay
//    }
    
    let cornerRadius: CGFloat = 10
    let outlineSize: CGFloat = 1
    @Binding var workoutDay: WorkoutDay
    var body: some View {
        List {
            ForEach($workoutDay.workouts) { $workout in
                Section(header: HStack {
                    Text(workout.name)
                    Spacer()
                    NavigationLink(destination: WorkoutLogView(workoutDay: $workoutDay, workout: $workout)) {
                        Text("Show Records")
                            .font(Font.subheadline)
                            .foregroundColor(Color("angelYellow"))
                    }
                }) {
                    WorkoutChartView(workout: $workout)
//                    WorkoutChartView(workouts: .constant(WorkoutDay.sampleData[0].workouts))
                        .listRowInsets(EdgeInsets())
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
//                .listRowInsets(.init(top: 10,
//                     leading: 0,
//                     bottom: 0,
//                     trailing: 0)
//                )
            }
            .listRowBackground(Color("royalBlue"))
        }
        .navigationTitle(workoutDay.name)
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
    }
}

struct WorkoutChartView_Previews: PreviewProvider {
    static var previews: some View {
        @State var path = NavigationPath()
        NavigationStack(path: $path) {
            WorkoutDayChartView(workoutDay: .constant(WorkoutDay.sampleData[0]))
        }
    }
}
