//
//  TestView4.swift
//  Jym
//
//  Created by John Smith on 1/7/24.
//

import SwiftUI


struct TestView4: View {
//    init(sampleWorkoutDays: Binding<[WorkoutDay]>, path: Binding<NavigationPath>) {
//
//        Utils.navigationBarConfig()
//        self._sampleWorkoutDays = sampleWorkoutDays
//        self._path = path
//    }
    
    @State private var isPresentingNewWorkoutDayView = false
    @Environment(\.colorScheme) var colorScheme
    @State var refresh: Bool = false
//    @EnvironmentObject var sharedData: SharedData
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    @Binding var workoutDays: [WorkoutDay]
    @State private var mainWorkoutDay: WorkoutDay = WorkoutDay.emptyWorkoutDay
    @Binding var path: NavigationPath
    @State private var searchText = ""
    @State private var title = "Workout Days"
    let cornerRadius: CGFloat = 10
    let subtitleSize: CGFloat = 20
    let outlineSize: CGFloat = 1
    let emojiSize: CGFloat = 35
    var oldestWorkoutDay: WorkoutDay {
        let oldest = workoutDays.max {
            $0.lastWorkoutDay > $1.lastWorkoutDay
        } ?? WorkoutDay.emptyWorkoutDay
        return oldest
    }
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    StreaksView(workoutDays: $workoutDays)
                } footer: {
                    Text("The outermost rings represent streaks for each workout day. Ten weeks in a row yields a full circle. The four workouts with the longest streaks are shown.")
                        .padding([.leading, .trailing])
                        .foregroundColor(.gray)
                }
                .padding([.bottom])
                .font(.system(size: 12))
                .listRowInsets(EdgeInsets())
                .listRowBackground(
                    Color("royalBlue")
                )
                Section(header: Text("Recommended Next Workout")) {
                    
//                    NavigationLink(destination: TestView2())
//                    NavigationLink(value: $mainWorkoutDay)
//                    NavigationLink(destination: WorkoutDayView(workoutDay: $mainWorkoutDay))
                    NavigationLink(destination: TestView2(workouts: $mainWorkoutDay.workouts))
                    {
                        CardView(workoutDay: $mainWorkoutDay)
                    }
                    .listRowSeparatorTint(.yellow)
                    .foregroundColor(Color("angelYellow"))
                    .listRowBackground(
                        Color("royalBlueLight")
                    )
                    .listRowInsets(EdgeInsets())
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 10, style: .circular)
                            .stroke(Color("angelYellow"), lineWidth: 2)
                    )
                }
                .headerProminence(.increased)
                Section(header: Text("Browse Workouts")) {
                    ForEach($workoutDays) { $workoutDay in
                        
//                        NavigationLink(destination: TestView2())
//                        NavigationLink(value: $workoutDay)
//                        NavigationLink(destination: WorkoutDayView(workoutDay: $workoutDay))
                        NavigationLink(destination: TestView2(workouts: $mainWorkoutDay.workouts))
                        
                        {
                            CardView(workoutDay: $workoutDay)
                        }
                        .listRowSeparatorTint(.yellow)
                        .foregroundColor(Color("gold"))
                        .listRowBackground(
                            Color("royalBlueLight")
                        )
                    }
                    .onDelete { workoutDays.remove(atOffsets: $0) }
                }
                .headerProminence(.increased)
            }
            .navigationTitle("Workout Days")
//            .navigationDestination(for: Binding<WorkoutDay>.self) { workoutDay in
//                WorkoutDayView(workoutDay: workoutDay)
//            }
            
            .foregroundColor(.white)
            .background(Color("royalBlue"))
            .scrollContentBackground(.hidden)
            .scrollIndicators(.hidden)
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
                NewWorkoutDaySheet(workoutDays: $workoutDays, isPresentingNewWorkoutDayView: $isPresentingNewWorkoutDayView)
            }
//            .onChange(of: sharedData.presented) { presented in
//            }
        }
        .onAppear {
            mainWorkoutDay = oldestWorkoutDay
        }
    }
    
}

struct TestView4_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TestView4(workoutDays: .constant(WorkoutDay.sampleData), path: .constant(NavigationPath()))
        }
        
        
    }
}
