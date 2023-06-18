//
//  WorkoutTabView.swift
//  Jym
//
//  Created by John Smith on 5/9/23.
//

import SwiftUI

struct WorkoutTabView: View {
    @State var workoutDays = WorkoutDay.sampleData
    var body: some View {
        TabView {
            WorkoutDaysView()
                .tabItem {
                    Label("Workouts", systemImage: "dumbbell")
                }
            MainChartView(sampleWorkoutDays: $workoutDays)
                .tabItem {
                    Label("Chart", systemImage: "chart.bar.xaxis")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                
        }
        
    }
}

struct WorkoutTabView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTabView()
    }
}
