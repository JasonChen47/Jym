//
//  WorkoutDayView.swift
//  Jym
//
//  Created by John Smith on 5/9/23.
//

import SwiftUI

struct WorkoutDayView: View {
    

    @Binding var workoutDay: WorkoutDay
    
    @State private var editingWorkoutDay = WorkoutDay.emptyWorkoutDay
    @State private var isPresentingNewWorkoutView = false

    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    var body: some View {
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
                    NavigationLink(destination: WorkoutView(workout: $workout, workoutDay: $workoutDay)) {
                        ZStack {
                            EmptyView()
                        }
                    }
                    .listRowSeparatorTint(.yellow)
                    .background(
                        ZStack {
                            HStack {
                                Text(workout.name)
                                    .foregroundColor(Color("angelYellow"))
                                
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("angelYellow"))
                            }
                        }
                    )
                }
                
                .listRowBackground(
                    Color("royalBlueLight")
                )
            }
            .scrollContentBackground(.hidden)
            Spacer()
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
//                    Label("Add Item", systemImage: "plus")
                    Text("Edit")
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
                            Button("Done") {
                                workoutDay = editingWorkoutDay
                                isPresentingNewWorkoutView = false
                            }
                        }
                    }
            }
            
        }
        .navigationTitle(workoutDay.name)
//        .onChange(of: sharedData.presented) { presented in
//        }
    }
}

struct WorkoutDayView_Previews: PreviewProvider {
    static var previews: some View {
        @State var workoutsPath = NavigationPath()
        NavigationStack(path: $workoutsPath) {
            Group {
                WorkoutDayView(workoutDay: .constant(WorkoutDay.sampleData[0]))
            }
        }
    }
}
