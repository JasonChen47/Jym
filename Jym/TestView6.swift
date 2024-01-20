//
//  TestView6.swift
//  Jym
//
//  Created by John Smith on 1/18/24.
//

import SwiftUI

struct TestView6: View {
    @Binding var workoutDays: [WorkoutDay]
    @Binding var scrums: [DailyScrum]
    
    @State private var isPresentingNewWorkoutDayView: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        NavigationStack {
            List {
                Section {
                    ForEach($scrums) { $scrum in
//                        NavigationLink(destination: TestView5(workoutDay: $workoutDay))
                        NavigationLink(destination: NothingView())
                        {
                            Text(scrum.title)
                        }
                    }
                    .onDelete { workoutDays.remove(atOffsets: $0) }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
//                        .foregroundColor(Color.yellow)
                }
                ToolbarItem {
                    Button {
                        isPresentingNewWorkoutDayView = true
                    } label: {
                        Label("Add Item", systemImage: "plus")
//                            .foregroundColor(Color.yellow)
                    }
                }
            }
            .sheet(isPresented: $isPresentingNewWorkoutDayView) {
//                NewWorkoutDaySheet(workoutDays: $workoutDays, isPresentingNewWorkoutDayView: $isPresentingNewWorkoutDayView)
//                TestView7(workoutDays: $workoutDays)
                NothingView()
        }
        }
    }
}

#Preview {
    TestView6(workoutDays: .constant(WorkoutDay.sampleData), scrums: .constant(DailyScrum.sampleData))
}
