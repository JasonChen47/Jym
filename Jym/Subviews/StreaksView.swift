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
    
    var streakList: [(WorkoutDay, Int)] {
        var tempStreakList: [(WorkoutDay, Int)] = []
        for workoutDay in workoutDays {
            let allRecords = workoutDay.workouts.flatMap { $0.records }
            var sortedRecords: [Record] {
                let sorted = allRecords.sorted {
                    $0.date > $1.date
                }
                return sorted
            }
            // Only continue if sortedRecords is not empty
            if sortedRecords.count > 0 {
                // ReferenceDate will be the upper bound of the date range to check, while weekBeforeDate will be the lower bound
                var referenceDate = sortedRecords[0].date
                var weekBeforeDate = referenceDate.addingTimeInterval(-7 * 24 * 60 * 60)
                var count = 0
                var streakOngoing = true
                var index = 1
                
                // Check if the first workout is within 1 week of the current date. If so, add to count.
                if referenceDate > Date.now.addingTimeInterval(-7 * 24 * 60 * 60) {
                    count += 1
                    // Loop through from the most recent workout and go back a week each loop. Each week, check if there are workouts that are in that week. Loop for a max of 10 weeks.
                    while streakOngoing && index < 9 {
                        // Set lower bound on the date range
                        weekBeforeDate = referenceDate.addingTimeInterval(-7 * 24 * 60 * 60)
                        
                        // See if there is a record in the next week range. If so, update the count
                        var recordInRange: Bool {
                            return sortedRecords.contains { $0.date > weekBeforeDate && $0.date < referenceDate }
                        }
                        if recordInRange {
                            count += 1
                        }
                        // Otherwise, the streak count stops, and the loop exits
                        else {
                            streakOngoing = false
                        }
                        // Continue to the next loop. Update the range to move to 1 week earlier
                        referenceDate = weekBeforeDate
                        index += 1
                    }
                }
                tempStreakList.append((workoutDay, count))
            }
        }
        
        // Sort tempStreakList from highest to lowest streaks
        var sortedTempStreakList: [(WorkoutDay, Int)] {
            let sorted = tempStreakList.sorted {
                $0.1 > $1.1
            }
            return sorted
        }
        
        // Take the four highest
        var highestStreaks = sortedTempStreakList.prefix(4)
        
        // Fill array with empty workoutDays if there is still room. Append to end.
        for i in 0...3 {
            if !highestStreaks.indices.contains(i) {
                highestStreaks.append((WorkoutDay.emptyWorkoutDay, 0))
            }
        }
        
        return Array(highestStreaks)
    }
    
    var body: some View {
        let lineWidth = width/42
        let circleBottomPadding: CGFloat = 7
        
        let firstStreak = streakList[0].0
        let secondStreak = streakList[1].0
        let thirdStreak = streakList[2].0
        let fourthStreak = streakList[3].0
        
        // Convert to CFFloat and ensure that it is within a range of 10
        let streaks = [streakList[0].1, streakList[1].1, streakList[2].1, streakList[3].1]
        let filteredStreaks = streaks.map { $0 > 10 ? CGFloat(10) : CGFloat($0) }
        
        
        VStack {
            // Date
            HStack {
                Text(Date.now, style: .date)
                    .font(Font.subheadline)
                    .foregroundColor(Color.gray)
                    .padding(0)
//                    .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
            }
            // Circles
            HStack {
                // 1st highest streak
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.red, lineWidth: lineWidth)
                            .frame(width: width/3)
                            .opacity(0.3)
                        Circle()
                            .trim(from: 0, to: filteredStreaks[0]/10)
                            .stroke(Color.red, lineWidth: lineWidth)
                            .frame(width: width/3)
                        
                        Circle()
                            .stroke(Color("angelYellow"), lineWidth: lineWidth)
                            .frame(width: width/4)
                        Circle()
                            .stroke(Color("gold"), lineWidth: lineWidth)
                            .frame(width: width/6)
                    }
                    .padding(.bottom, circleBottomPadding)
                    Text(firstStreak.name)
                }
                VStack {
                    // 4th highest streak
                    VStack {
                        ZStack {
                            Circle()
                                .stroke(Color.red, lineWidth: lineWidth)
//                                .aspectRatio(contentMode: .fit)
                                .frame(width: width/13)
                                .opacity(0.3)
                            Circle()
                                .trim(from: 0, to: filteredStreaks[3]/10)
                                .stroke(Color.red, lineWidth: lineWidth)
                                .frame(width: width/13)
//                                .aspectRatio(contentMode: .fit)
                        }
                        .padding(.bottom, circleBottomPadding)
                        Text(fourthStreak.name)
                            .fixedSize()
                    }
                    .padding()
                    // 3rd highest streak
                    ZStack {
                        Circle()
                            .stroke(Color.red, lineWidth: lineWidth)
                            .frame(width: width/7)
                            .opacity(0.3)
                        Circle()
                            .trim(from: 0, to: filteredStreaks[2]/10)
                            .stroke(Color.red, lineWidth: lineWidth)
                            .frame(width: width/7)
                        Circle()
                            .stroke(Color("angelYellow"), lineWidth: lineWidth)
                            .frame(width: width/15)
                    }
                    .padding(.bottom, circleBottomPadding)
                    Text(thirdStreak.name)
                }
                .padding([.leading, .trailing])
                // 2nd highest streak
                VStack {
                    ZStack {
                        Circle()
                            .stroke(Color.red, lineWidth: lineWidth)
                            .frame(width: width/5)
                            .opacity(0.3)
                        Circle()
                            .trim(from: 0, to: filteredStreaks[1]/10)
                            .stroke(Color.red, lineWidth: lineWidth)
                            .frame(width: width/5)
                        Circle()
                            .stroke(Color("angelYellow"), lineWidth: lineWidth)
                            .frame(width: width/8)
                    }
                    .padding(.bottom, circleBottomPadding)
                    Text(secondStreak.name)
                    Spacer()
                }
            }
//            .padding()
            .padding([.leading, .trailing])
            
        }
        .onAppear {
            // Go through all the WorkoutDays and if the lastWorkoutDay older than 2 weeks ago, set the streaks to 0.
            for index in workoutDays.indices {
                if workoutDays[index].lastWorkoutDay < Date.now.addingTimeInterval(-14 * 24 * 60 * 60) {
                        workoutDays[index].streak = 0
                }
            }
            
            // Go through each workoutday
            // Get the records from all the workouts for each workout day
            // Sort them in order
            // Loop through weeks up to 10 weeks. Have a veriable called workoutDayToCheck. Have a variable called streakongoing. While the streakongoing is true, then the while loop continues. Have a variable called count. Check 1 week back. See if the lastWorkoutDay is within that 1 week. If it is, set count += 1. Else, set the streakOngoing to false. Then check in the week before lastWorkoutDay (between that lastWorkoutDay and 7 days prior). If there is one, set that to the workoutDayToCheck
            
//            for workoutDay in workoutDays {
//                <#body#>
//            }
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
