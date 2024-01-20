//
//  TestTabView.swift
//  Jym
//
//  Created by John Smith on 1/7/24.
//

import SwiftUI

struct TestTabView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @Binding var workoutDays: [WorkoutDay]
//    @Binding var scrums: [DailyScrum]
    let saveAction: ()->Void
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        TabView() {
//            WorkoutDaysView(workoutDays: $workoutDays, path: .constant(NavigationPath()))
//            TestView3(workoutDays: $workoutDays)
//                .tabItem {
//                    Label("Workouts", systemImage: "dumbbell")
//                }
//                .tag(1)
//            TestView6(workoutDays: .constant(WorkoutDay.sampleData), scrums: .constant(DailyScrum.sampleData))
            ScrumsView(scrums: .constant(DailyScrum.sampleData))
                .tabItem {
                    Label("Workouts", systemImage: "dumbbell")
                }
                .tag(1)
            NothingView()
                .tabItem {
                    Label("Workouts2", systemImage: "dumbbell")
                }
                .tag(2)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

#Preview {
    TestTabView(workoutDays: .constant(WorkoutDay.sampleData), saveAction: {})
}
