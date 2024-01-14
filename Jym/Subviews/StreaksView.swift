//
//  StreaksView.swift
//  Jym
//
//  Created by John Smith on 1/7/24.
//

import SwiftUI

struct StreaksView: View {
    
    @Binding var workoutDays: [WorkoutDay]
    
    let width = UIScreen.main.bounds.size.width
    
    var highestStreaks: [WorkoutDay] {
        // Sort streaks from lowest to highest
        let recentWorkoutDays = workoutDays.filter { Calendar.current.isDateInToday($0.lastWorkoutDay) || Calendar.current.isDateInYesterday($0.lastWorkoutDay) }
        
        let sorted = recentWorkoutDays.sorted {
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
    
    var body: some View {
        let firstStreak = highestStreaks[0]
        let secondStreak = highestStreaks[1]
        let thirdStreak = highestStreaks[2]
        let fourthStreak = highestStreaks[3]
        
        var streaks = [firstStreak.streak, secondStreak.streak, thirdStreak.streak, fourthStreak.streak]
        var filteredStreaks = streaks.map { $0 > 10 ? CGFloat(10) : CGFloat($0) }
        
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
        .onAppear {
            // Go through all the WorkoutDays and then see if the lastWorkoutDay was yesterday or today. If it is not, set the streaks to 0.
            for index in workoutDays.indices {
                if !Calendar.current.isDateInToday(workoutDays[index].lastWorkoutDay) && !Calendar.current.isDateInYesterday(workoutDays[index].lastWorkoutDay) {
                        workoutDays[index].streak = 0
                }
            }
        }
    }
}

#Preview {
    List {
        Section {
            StreaksView(workoutDays: .constant(WorkoutDay.sampleData))
            
        }
    footer: {
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
                
            } label: {
                Label("Add Item", systemImage: "plus")
                    .foregroundColor(Color.yellow)
            }
        }
    }
    
}
