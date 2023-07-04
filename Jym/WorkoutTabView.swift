//
//  WorkoutTabView.swift
//  Jym
//
//  Created by John Smith on 5/9/23.
//

import SwiftUI

struct WorkoutTabView: View {
    @State var workoutDays = WorkoutDay.sampleData
    @State var mainWorkoutDay = WorkoutDay.sampleData[3]
    var body: some View {
        TabView {
            WorkoutDaysView(sampleWorkoutDays: $workoutDays, mainWorkoutDay: $mainWorkoutDay)
                .tabItem {
                    Label("Workouts", systemImage: "dumbbell")
                }
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
            MainChartView(sampleWorkoutDays: $workoutDays)
                .tabItem {
                    Label("Charts", systemImage: "chart.bar.xaxis")
                }
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
        }
        
    }
}

struct WorkoutTabView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTabView()
    }
}
