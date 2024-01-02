//
//  AllWorkoutsView.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import SwiftUI
import UIKit

struct WorkoutDaysView: View {
    init(sampleWorkoutDays: Binding<[WorkoutDay]>, path: Binding<NavigationPath>) {
        
        Utils.navigationBarConfig()
        self._sampleWorkoutDays = sampleWorkoutDays
        self._path = path
    }
    
    @State private var workoutDays: [WorkoutDay] = []
    @State private var isPresentingNewWorkoutDayView = false
    @Environment(\.colorScheme) var colorScheme
    @State var refresh: Bool = false
    @EnvironmentObject var sharedData: SharedData
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    @Binding var sampleWorkoutDays: [WorkoutDay]
    @State private var mainWorkoutDay: WorkoutDay = WorkoutDay.emptyWorkoutDay
    @Binding var path: NavigationPath
    @State private var searchText = ""
    @State private var title = "Workout Days"
    let cornerRadius: CGFloat = 10
    let subtitleSize: CGFloat = 20
    let outlineSize: CGFloat = 1
    let emojiSize: CGFloat = 35
    var highestStreaks: [WorkoutDay] {
        // Sort streaks from lowest to highest
        let sorted = sampleWorkoutDays.sorted {
            $0.streak < $1.streak
        }
        var reversedFour: [WorkoutDay] = sorted.suffix(4).reversed()
        for i in 0...3 {
            if !reversedFour.indices.contains(i) {
                reversedFour.append(WorkoutDay.emptyWorkoutDay)
            }
        }
        return reversedFour
    }
    var oldestWorkoutDay: WorkoutDay {
        let oldest = sampleWorkoutDays.max {
            $0.lastWorkoutDay > $1.lastWorkoutDay
        } ?? WorkoutDay.emptyWorkoutDay
        return oldest
    }
    
    var body: some View {
        let firstStreak = highestStreaks[0]
        let secondStreak = highestStreaks[1]
        let thirdStreak = highestStreaks[2]
        let fourthStreak = highestStreaks[3]
        
        var streaks = [firstStreak.streak, secondStreak.streak, thirdStreak.streak, fourthStreak.streak]
        var filteredStreaks = streaks.map { $0 > 10 ? CGFloat(10) : CGFloat($0) }
        
        NavigationStack(path: $path) {
            List {
                Section {
                    VStack {
                        // Date
                        HStack {
                            Text(Date.now, style: .date)
                                .font(Font.subheadline)
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                        // Circles
                        HStack {
                            // 1st highest streak
                            VStack {
                                ZStack {
                                    Circle()
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/3)
                                        .opacity(0.3)
                                    Circle()
                                        .trim(from: 0, to: filteredStreaks[0]/10)
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/3)
                                        
                                    Circle()
                                        .stroke(Color("angelYellow"), lineWidth: 10)
                                        .frame(width: width/4)
                                    Circle()
                                        .stroke(Color("gold"), lineWidth: 10)
                                        .frame(width: width/6)
                                }
                                Text(firstStreak.name)
                            }
                            VStack {
                                // 4th highest streak
                                VStack {
                                    ZStack {
                                        Circle()
                                            .stroke(Color.red, lineWidth: 10)
                                            .aspectRatio(contentMode: .fit)
                                            .opacity(0.3)
                                        Circle()
                                            .trim(from: 0, to: filteredStreaks[3]/10)
                                            .stroke(Color.red, lineWidth: 10)
                                            .aspectRatio(contentMode: .fit)
                                    }
                                    Text(fourthStreak.name)
                                        .fixedSize()
                                }
                                .padding()
                                // 3rd highest streak
                                ZStack {
                                    Circle()
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/7)
                                        .opacity(0.3)
                                    Circle()
                                        .trim(from: 0, to: filteredStreaks[2]/10)
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/7)
                                    Circle()
                                        .stroke(Color("angelYellow"), lineWidth: 10)
                                        .frame(width: width/15)
                                }
                                Text(thirdStreak.name)
                            }
                            .padding([.leading, .trailing])
                            // 2nd highest streak
                            VStack {
                                ZStack {
                                    Circle()
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/5)
                                        .opacity(0.3)
                                    Circle()
                                        .trim(from: 0, to: filteredStreaks[1]/10)
                                        .stroke(Color.red, lineWidth: 10)
                                        .frame(width: width/5)
                                    Circle()
                                        .stroke(Color("angelYellow"), lineWidth: 10)
                                        .frame(width: width/8)
                                }
                                Text(secondStreak.name)
                                Spacer()
                            }
                        }
                        .padding([.leading, .trailing])
                    }
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
                    NavigationLink(value: $mainWorkoutDay) {
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
                    ForEach($sampleWorkoutDays) { $workoutDay in
                        NavigationLink(value: $workoutDay) {
                            CardView(workoutDay: $workoutDay)
                        }
                        .listRowSeparatorTint(.yellow)
                        .foregroundColor(Color("gold"))
                        .listRowBackground(
                            Color("royalBlueLight")
                        )
                    }
                }
                .headerProminence(.increased)
            }
            .navigationTitle("Workout Days")
            .navigationDestination(for: Binding<WorkoutDay>.self) { workoutDay in
                WorkoutDayView(workoutDay: workoutDay)
            }
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
                NewWorkoutDaySheet(workoutDays: $sampleWorkoutDays, isPresentingNewWorkoutDayView: $isPresentingNewWorkoutDayView)
            }
            .onChange(of: sharedData.presented) { presented in
            }
        }
        .onAppear {
            mainWorkoutDay = oldestWorkoutDay
        }
    }
    private func getStreak(workoutDay: WorkoutDay) {
        
    }
}

struct AllWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkoutDaysView(sampleWorkoutDays: .constant(WorkoutDay.sampleData), path: .constant(NavigationPath()))
        }.environmentObject(SharedData())
        
        
    }
}

