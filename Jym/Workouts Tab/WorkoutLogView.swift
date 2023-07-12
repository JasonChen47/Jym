//
//  WorkoutLogView.swift
//  Jym
//
//  Created by John Smith on 7/7/23.
//

import SwiftUI

struct WorkoutLogView: View {
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
            VStack {
                HStack {
                    Text("Full Workout Log")
                        .foregroundColor(.white)
                        .font(.system(size: 30))
                        .bold()
                }
            }
            .listRowInsets(EdgeInsets())
            .listRowBackground(
                Color("royalBlue")
            )
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
        .padding(.top, -35)
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
        .toolbarBackground(Color("royalBlue"), for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .accentColor(Color("angelYellow"))
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
                    .foregroundColor(Color("angelYellow"))
            }
            ToolbarItem {
                Button{
                    print("hi")
                } label: {
                    Label("Add Item", systemImage: "plus")
                        .foregroundColor(Color("angelYellow"))
                }
            }
        }
        .onChange(of: sharedData.presented) { presented in
            
        }
    }
}

struct WorkoutLogView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationStack {
                WorkoutLogView(workout: .constant(WorkoutDay.sampleData[0].workouts[0]))
            }
        }.environmentObject(SharedData())
    }
}
