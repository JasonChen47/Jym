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
    @State private var isPresentingNewWorkoutDayView = false
    
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
                    .onDelete { workoutDays.remove(atOffsets: $0) }
                    
                }
                
                Section {
                    ForEach($workoutDays) { $workoutDay in
                        NavigationLink(destination: TestView5(workoutDay: $workoutDay)) {
                            Text(workoutDay.name)
                        }
                    }
                    .onDelete { workoutDays.remove(atOffsets: $0) }
                }
                .listRowSeparatorTint(.yellow)
                .foregroundColor(Color("gold"))
                .listRowBackground(
                    Color("royalBlueLight")
                )
            }
            .navigationTitle("Workout Days")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                        .foregroundColor(Color.yellow)
                }
                ToolbarItem {
                    Button {
                        isPresentingNewWorkoutDayView = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
                            .foregroundColor(Color.yellow)
                    }
                }
            }
            .sheet(isPresented: $isPresentingNewWorkoutDayView) {
                TestView2(workouts: $workoutDays[0].workouts)
            }
        }
    }
}

#Preview {
    TestView3(workoutDays: .constant(WorkoutDay.sampleData))
}
