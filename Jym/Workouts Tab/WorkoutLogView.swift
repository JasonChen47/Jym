//
//  WorkoutLogView.swift
//  Jym
//
//  Created by John Smith on 7/7/23.
//

import SwiftUI

struct WorkoutLogView: View {
    
    init(workout: Binding<Workout>) {
        Utils.navigationBarConfig()
        self._workout = workout
    }
    
    @EnvironmentObject var sharedData: SharedData
    @Environment(\.dismiss) var dismiss
    @Binding var workout: Workout
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        let df: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
            return formatter
        }()
        @State var sortOrder = [KeyPathComparator(\Record.date)]
        var sortedRecords: [Record] {
            let sorted = workout.records.sorted {
                $0.date > $1.date
            }
            return sorted
        }
        List {
            Section {
                Grid {
                    GridRow {
                        Text("Date")
                        Text("Lbs")
                        Text("Reps")
                        Text("Sets")
                    }
                    .bold()
                    Divider()
                        .overlay(.yellow)
                    ForEach(sortedRecords) { record in
                        GridRow {
                            Text(df.string(from: record.date))
                            Text(String(record.weight))
                            Text(String(record.reps))
                            Text(String(record.sets))
                        }
                    }
                }
                .listRowSeparatorTint(.yellow)
                .foregroundColor(Color("angelYellow"))
                .listRowBackground(
                    Color("royalBlueLight")
                )
            }
        }
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button{
                    print("hi")
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
        .navigationTitle("Full Workout Log")
//        .onChange(of: sharedData.presented) { presented in
//        }
    }
}

struct WorkoutLogView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                WorkoutLogView(workout: .constant(WorkoutDay.sampleData[0].workouts[0]))
            }
        }
    }
}
