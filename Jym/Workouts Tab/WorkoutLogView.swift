//
//  WorkoutLogView.swift
//  Jym
//
//  Created by John Smith on 7/7/23.
//

import SwiftUI

struct WorkoutLogView: View {
    
    @Binding var workout: Workout
    
    @State private var isPresentingEditRecordsSheet = false
    @State private var isPresentingEditRecordSheet = false
    @State private var editingRecord = Record.emptyRecord
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        let df: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
            return formatter
        }()
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
                    ForEach(workout.records.reversed()) { record in
                        GridRow {
                            Text(df.string(from: record.date))
                            Text(String(record.weight))
                            Text(String(record.reps))
                            Text(String(record.sets))
                        }
                    }
                }
            }

            .listRowSeparatorTint(.yellow)
            .foregroundColor(Color("angelYellow"))
            .listRowBackground(
                Color("royalBlueLight")
            )
        }
        .foregroundColor(.white)
        .scrollContentBackground(.hidden)
        .scrollIndicators(.hidden)
        .background(Color("royalBlue"))
        .toolbar {
            ToolbarItem {
                Button {
                    isPresentingEditRecordSheet = true
                } label: {
                    Label("Add Item", systemImage: "plus")
                        .foregroundColor(Color.yellow)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresentingEditRecordsSheet = true
                } label: {
                    Text("Edit")
                }
            }
        }
        // Editing all records
        .sheet(isPresented: $isPresentingEditRecordsSheet) {
            NavigationStack {
                EditRecordsSheet(records: $workout.records, isPresentingEditRecordsSheet: $isPresentingEditRecordsSheet)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                workout.records.sort {
                                    $0.date < $1.date
                                }
                                isPresentingEditRecordsSheet = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                workout.records.sort {
                                    $0.date < $1.date
                                }
                                isPresentingEditRecordsSheet = false
                            }
                        }
                    }
            }
        }
        // Adding one record
        .sheet(isPresented: $isPresentingEditRecordSheet) {
            NavigationStack {
                EditRecordSheet(record: $editingRecord, records: $workout.records, isPresentingEditRecordsSheet: $isPresentingEditRecordSheet)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                isPresentingEditRecordSheet = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                // Append to the list of records
                                workout.records.append(editingRecord)
                                workout.records.sort {
                                    $0.date < $1.date
                                }
                                isPresentingEditRecordSheet = false
                            }
                        }
                    }
            }
        }
        .onAppear {
            workout.records.sort {
                $0.date < $1.date
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
