//
//  TestView5.swift
//  Jym
//
//  Created by John Smith on 1/7/24.
//

import SwiftUI

struct TestView5: View {
    @Binding var workoutDay: WorkoutDay
    
    @State private var editingWorkoutDay = WorkoutDay.emptyWorkoutDay
    @State private var isPresentingNewWorkoutView = false
    
    @Environment(\.dismiss) var dismiss

    
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        VStack {
            Rectangle()
                .fill(.linearGradient(
                    Gradient(colors:[Color("royalBlueLight"), Color("royalBlueLight").opacity(0.5)]),
                startPoint: UnitPoint(x: 0, y: 0.5),
                endPoint: UnitPoint(x: 1, y: 0.5)
            ))
                .aspectRatio(1.618, contentMode: .fit)
                .overlay(
                    EmptyView()
                        .background(
                            HStack {
                                ZStack {
                                    Circle()
                                        .foregroundColor(Color("royalBlue"))
                                        .frame(width: width*0.4, height: width*0.4, alignment: .center)
                                    Text(workoutDay.emoji)
                                        .font(.system(size: 120))
                                    
                                }
                                .padding()
                            }
                        )
                )
            List {
                ForEach($workoutDay.workouts) { $workout in
                    NavigationLink(destination: WorkoutView(workout: $workout, workoutDay: $editingWorkoutDay)) {
                        Text(workout.name)
                    }
                }
                .listRowBackground(
                    Color("royalBlueLight")
                )
            }
            .scrollContentBackground(.hidden)
        }
        .background(Color("royalBlue"))
        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                EditButton()
//            }
            ToolbarItem {
                Button{
                    isPresentingNewWorkoutView = true
                    editingWorkoutDay = workoutDay
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresentingNewWorkoutView) {
            NavigationStack {
                NewWorkoutSheet(editingWorkoutDay: $editingWorkoutDay, isPresentingNewWorkoutView: $isPresentingNewWorkoutView)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingNewWorkoutView = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                workoutDay = editingWorkoutDay
                                isPresentingNewWorkoutView = false
                            }
                        }
                    }
            }
            
        }
        .navigationTitle(workoutDay.name)
        
    }
}

#Preview {
    NavigationStack {
        TestView5(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
    
}
