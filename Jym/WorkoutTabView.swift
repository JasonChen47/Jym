//
//  WorkoutTabView.swift
//  Jym
//
//  Created by John Smith on 5/9/23.
//

import SwiftUI
class SharedData: ObservableObject {
    @Published var presented = true
}

struct WorkoutTabView: View {
    @State var workoutsPath = NavigationPath()
    @State var emptyPath = NavigationPath()
    @State var intPath: [Int] = []
    @State var workoutDays = WorkoutDay.sampleData
    @State var mainWorkoutDay = WorkoutDay.sampleData[3]
    @State private var tabSelection = 0
    @State private var tappedTwice: Bool = false
    @StateObject var sharedData = SharedData()
    var body: some View {
        var handler: Binding<Int> { Binding(
            get: { self.tabSelection },
            set: {
                if $0 == self.tabSelection {
                    // Lands here if user tapped more than once
                    tappedTwice = true
                }
                self.tabSelection = $0
            }
        )}
        TabView(selection: handler) {
//        TabView() {
            WorkoutDaysView(sampleWorkoutDays: $workoutDays, mainWorkoutDay: $mainWorkoutDay, path: $workoutsPath, intPath: $intPath)
                
                .tabItem {
                    Label("Workouts", systemImage: "dumbbell")
                }
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
                .onChange(of: tappedTwice, perform: { tappedTwice in         guard tappedTwice else { return }
                    withAnimation(.easeOut(duration: 3)) {
                        sharedData.presented.toggle()
                    }
                    workoutsPath = emptyPath
//                    print(workoutsPath)
                    print("toggled")
                    self.tappedTwice = false
                })
                .onChange(of: tabSelection) { tabSelection in
                  sharedData.presented.toggle()
                    print("7")
                }
                .tag(0)
                
                
            MainChartView(sampleWorkoutDays: $workoutDays)
                .tabItem {
                    Label("Charts", systemImage: "chart.bar.xaxis")
                }
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
                .tag(1)
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
                .tag(2)
        }
//        .navigationViewStyle(StackNavigationViewStyle())
//        .onReceive($tabSelection) { newSelection in
//            if newSelection == self.tabSelection {
//                // Lands here if user tapped more than once
//                tappedTwice = true
//            }
//            self.tabSelection = newSelection
//        }
        .environmentObject(sharedData)
    }
}

struct WorkoutTabView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTabView()
    }
}
