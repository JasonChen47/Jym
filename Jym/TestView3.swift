//
//  TestView3.swift
//  Jym
//
//  Created by John Smith on 1/7/24.
//

import SwiftUI

struct TestView3: View {
    
    @Binding var workoutDays: [WorkoutDay]
//    @State var mainWorkoutDay = WorkoutDay.emptyWorkoutDay
    @State var mainWorkoutDay = [WorkoutDay.emptyWorkoutDay]
    @State var stateWorkoutDays = WorkoutDay.sampleData
    
    var body: some View {
        NavigationStack {
           
            List {
//                Section {
//                    NavigationLink(destination: TestView2(workoutDay: $mainWorkoutDay))
//                    {
//                        Text("hi")
//                    }
//                }
                Section {
                    ForEach($workoutDays) { $workoutDay in
                        NavigationLink(destination: TestView2(workouts: $workoutDay.workouts)) {
                            Text(workoutDay.name)
                        }
                    }
                }
                
                Section {
                    ForEach($workoutDays) { $workoutDay in
                        NavigationLink(destination: TestView5(workoutDay: $workoutDay)) {
                            Text(workoutDay.name)
                        }
                    }
                }
                .listRowSeparatorTint(.yellow)
                .foregroundColor(Color("gold"))
                .listRowBackground(
                    Color("royalBlueLight")
                )
            }
            .navigationTitle("Workout Days")

        }
    }
}

#Preview {
    TestView3(workoutDays: .constant(WorkoutDay.sampleData))
}
