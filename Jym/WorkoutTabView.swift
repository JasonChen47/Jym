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
    @Environment(\.scenePhase) private var scenePhase
    @State var workoutsPath = NavigationPath()
    @State var chartsPath = NavigationPath()
    @State var settingsPath = NavigationPath()
    @State var emptyPath = NavigationPath()
    @Binding var workoutDays: [WorkoutDay]
    @State private var tabSelection = 1
    @State private var tappedTwice: Bool = false
    @StateObject var sharedData = SharedData()
    let saveAction: ()->Void
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
        TabView() {
            WorkoutDaysView(workoutDays: $workoutDays)
                .tabItem {
                    Label("Workouts", systemImage: "dumbbell")
                }
                .onChange(of: tappedTwice, perform: { tappedTwice in         guard tappedTwice else { return }
                    if tabSelection == 1 {
                        workoutsPath = emptyPath
                        self.tappedTwice = false
                    }
                })
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            .tag(1)
            
                
            MainChartView(workoutDays: $workoutDays)
                .tabItem {
                    Label("Charts", systemImage: "chart.bar.xaxis")
                }
                .onChange(of: tappedTwice, perform: { tappedTwice in         guard tappedTwice else { return }
                    if tabSelection == 2 {
                        chartsPath = emptyPath
                        self.tappedTwice = false
                    }
                })
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tag(2)
//            TestView(workoutDays: $workoutDays)
            SettingsView(path: $settingsPath)
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
                .onChange(of: tappedTwice, perform: { tappedTwice in         guard tappedTwice else { return }
                    if tabSelection == 3 {
                        settingsPath = emptyPath
                        self.tappedTwice = false
                    }
                })
                .toolbarBackground(Color("royalBlue"), for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                .tag(3)
        }
        .onChange(of: scenePhase) { phase in
            if phase == .inactive { saveAction() }
        }
    }
}

struct WorkoutTabView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutTabView(workoutDays: .constant(WorkoutDay.sampleData), saveAction: {})
    }
}
