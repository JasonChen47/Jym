//
//  AllWorkoutsView.swift
//  Jym
//
//  Created by John Smith on 5/4/23.
//

import SwiftUI


struct WorkoutDaysView: View {
    
    init(workoutDays: Binding<[WorkoutDay]>, path: Binding<NavigationPath>) {
        Utils.navigationBarConfig()
        self._workoutDays = workoutDays
        self._path = path
        self.firstTimeShown = true
    }

    @Binding var workoutDays: [WorkoutDay]
    @Binding var path: NavigationPath
    
    @State private var isPresentingNewWorkoutDayView = false
    @State private var emptyWorkoutDay = WorkoutDay.emptyWorkoutDay
    @State private var firstTimeShown: Bool = true
    
    @State private var searchText = ""
    @State private var title = "Workout Days"
//    @State var mainWorkoutDay: [WorkoutDay] = [WorkoutDay.emptyWorkoutDay]
    @State private var mainWorkoutDay = [WorkoutDay.emptyWorkoutDay]
    var extraWorkoutDay: Binding<WorkoutDay> {
        Binding(get: {
            let oldest = self.workoutDays.max {
                $0.lastWorkoutDay > $1.lastWorkoutDay
            } ?? WorkoutDay.emptyWorkoutDay
            return oldest
        }, set: { newWorkoutDay in
            
        }
        )
    }

    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
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
    
    @State var indexOfLongestAgoWorkoutDay = -1
    @State var onAppearTriggered = false
    
    var body: some View {
        
        
        
        NavigationStack {
            List {
                Section {
                    VStack {
                        StreaksView(workoutDays: $workoutDays)
                            .frame(maxWidth: width)
//                            .listRowInsets(EdgeInsets())
//                        Image("greek lifting")
//                            .renderingMode(.template)
//                            .resizable()
//                            .scaledToFit()
//                            .foregroundColor(.orange)
//                            .background(Color("royalBlue"))
//                            .listRowBackground(
//                                Color("royalBlue")
//                            )
                    }
                    
                } 
            footer: {
                    Text("Rings fill based on the the number of concurrent weeks workout days are performed")
                        .padding([.leading, .trailing])
                        .foregroundColor(.gray)
                }
//                .padding([.bottom])
                .font(.system(size: 12))
//                .listRowInsets(EdgeInsets())
                .listRowBackground(
                    Color("royalBlue")
                )
                
                Section(header: Text("Next Workout Day")) {
//                    ForEach($mainWorkoutDay) { $workoutDay in
//                        NavigationLink(destination: WorkoutDayView(workoutDay: $workoutDay))
//                        {
////                            CardView(workoutDay: extraWorkoutDay)
//                            CardView(workoutDay: $workoutDay)
//                        }
//                    }
//                    .listRowSeparatorTint(.yellow)
//                    .foregroundColor(Color("angelYellow"))
//                    .listRowBackground(
//                        Color("royalBlueLight")
//                    )
//                    .listRowInsets(EdgeInsets())
//                    .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10, style: .circular)
//                            .stroke(Color("angelYellow"), lineWidth: 2)
//                    )
                    
//                    if let indexOfLongestAgoWorkoutDay = workoutDays.indices.max(by: {
//                        workoutDays[$0].lastWorkoutDay > workoutDays[$1].lastWorkoutDay
//                    }) {
////                        let longestAgoWorkoutDay = $workoutDays[indexOfLongestAgoWorkoutDay]
//                        NavigationLink(destination: WorkoutDayView(workoutDay: $workoutDays[indexOfLongestAgoWorkoutDay]))
//                        {
//                            CardView(workoutDay: $workoutDays[indexOfLongestAgoWorkoutDay])
//                        }
//                        .listRowSeparatorTint(.yellow)
//                        .foregroundColor(Color("angelYellow"))
//                        .listRowBackground(
//                            Color("royalBlueLight")
//                        )
//                        .listRowInsets(EdgeInsets())
//                        .padding()
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10, style: .circular)
//                                .stroke(Color("angelYellow"), lineWidth: 2)
//                        )
//                    }
//                    else {
//                        NavigationLink(destination: WorkoutDayView(workoutDay: $emptyWorkoutDay))
//                        {
//                            CardView(workoutDay: $emptyWorkoutDay)
//                        }
//                        .listRowSeparatorTint(.yellow)
//                        .foregroundColor(Color("angelYellow"))
//                        .listRowBackground(
//                            Color("royalBlueLight")
//                        )
//                        .listRowInsets(EdgeInsets())
//                        .padding()
//                        .overlay(
//                            RoundedRectangle(cornerRadius: 10, style: .circular)
//                                .stroke(Color("angelYellow"), lineWidth: 2)
//                        )
//                    }
//                    NavigationLink(destination: WorkoutDayView(workoutDay: extraWorkoutDay))
//                    {
//                        CardView(workoutDay: extraWorkoutDay)
//                    }
//                    .listRowSeparatorTint(.yellow)
//                    .foregroundColor(Color("angelYellow"))
//                    .listRowBackground(
//                        Color("royalBlueLight")
//                    )
//                    .listRowInsets(EdgeInsets())
//                    .padding()
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 10, style: .circular)
//                            .stroke(Color("angelYellow"), lineWidth: 2)
//                    )
                    
                    // THIRD ATTEMPT
                    // The first time, use the if let
                    // All other times, don't use the if let because it causes reassignment during the run
                    if firstTimeShown == true {
                        if let indexOfLongestAgoWorkoutDay = workoutDays.indices.max(by: {
                            workoutDays[$0].lastWorkoutDay > workoutDays[$1].lastWorkoutDay
                        }) {
    //                        let longestAgoWorkoutDay = $workoutDays[indexOfLongestAgoWorkoutDay]
                            NavigationLink(destination: WorkoutDayView(workoutDay: $workoutDays[indexOfLongestAgoWorkoutDay]))
                            {
                                CardView(workoutDay: $workoutDays[indexOfLongestAgoWorkoutDay])
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
                        else {
                            NavigationLink(destination: WorkoutDayView(workoutDay: $emptyWorkoutDay))
                            {
                                CardView(workoutDay: $emptyWorkoutDay)
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
                    }
                    
                    else if indexOfLongestAgoWorkoutDay != -1 && workoutDays.count > 0 {
//                      let longestAgoWorkoutDay = $workoutDays[indexOfLongestAgoWorkoutDay]
                        NavigationLink(destination: WorkoutDayView(workoutDay: $workoutDays[indexOfLongestAgoWorkoutDay]))
                        {
                            CardView(workoutDay: $workoutDays[indexOfLongestAgoWorkoutDay])
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
                    
                    else {
                        NavigationLink(destination: WorkoutDayView(workoutDay: $emptyWorkoutDay))
                        {
                            CardView(workoutDay: $emptyWorkoutDay)
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
                    
                }
                .headerProminence(.increased)
                Section(header: Text("Browse Workout Days")) {
                    ForEach($workoutDays) { $workoutDay in
                        NavigationLink(destination: WorkoutDayView(workoutDay: $workoutDay))
//                        NavigationLink(value: workoutDay.id)
                        {
                            CardView(workoutDay: $workoutDay)
                        }
                        .listRowSeparatorTint(.yellow)
                        .foregroundColor(Color("gold"))
                        .listRowBackground(
                            Color("royalBlueLight")
//                            .thinMaterial
                        )
                    }
                    .onDelete { workoutDays.remove(atOffsets: $0) }
//                    .navigationDestination(for: Binding<WorkoutDay>.self) { workoutDay in
//                                    WorkoutDayView(workoutDay: workoutDay)
//                                }

                }
                .headerProminence(.increased)
//                Image("greek fight")
//                    .renderingMode(.template)
//                    .resizable()
//                    .scaledToFit()
//                    .foregroundColor(
////                        Color("royalBlueLight")
//                        .orange
//                    )
////                    .brightness(0.2)
//                    .opacity(0.7)
//                    .background(Color("royalBlue"))
//                    
//                    .listRowBackground(
//                        Color("royalBlue")
//                    )
            }
            .navigationTitle("Workout Days")
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
            .onAppear {
                mainWorkoutDay[0] = oldestWorkoutDay
                
                if !workoutDays.isEmpty {
                    indexOfLongestAgoWorkoutDay = workoutDays.indices.max(by: {
                        workoutDays[$0].lastWorkoutDay > workoutDays[$1].lastWorkoutDay
                    }) ?? -1
                }
                onAppearTriggered = true
                
//                if let indexOfLongestAgoWorkoutDay = workoutDays.indices.max(by: {
//                    workoutDays[$0].lastWorkoutDay > workoutDays[$1].lastWorkoutDay
//                }) {
//                    print("hi")
//                }
            }
            .onDisappear {
                firstTimeShown = false
            }
        }
        
    }
    
}

struct AllWorkoutsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            WorkoutDaysView(workoutDays: .constant(WorkoutDay.sampleData), path: .constant(NavigationPath()))
        }
        
        
    }
}

