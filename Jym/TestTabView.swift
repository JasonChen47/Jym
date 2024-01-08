//
//  TestTabView.swift
//  Jym
//
//  Created by John Smith on 1/7/24.
//

import SwiftUI

struct TestTab: View {
    
    @Environment(\.scenePhase) private var scenePhase
    @Binding var workoutDays: [WorkoutDay]
    let saveAction: ()->Void
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        TabView() {
//            WorkoutDaysView(workoutDays: $workoutDays, path: .constant(NavigationPath()))
            TestView3(workoutDays: $workoutDays)
                .tabItem {
                    Label("Workouts", systemImage: "dumbbell")
                }
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

#Preview {
    TestTab(workoutDays: .constant(WorkoutDay.sampleData), saveAction: {})
}
