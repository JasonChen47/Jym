//
//  EditRecordsSheet.swift
//  Jym
//
//  Created by John Smith on 1/10/24.
//

import SwiftUI

struct EditRecordsSheet: View {
    
    @Binding var workoutDay: WorkoutDay
    @Binding var records: [Record]
    @Binding var isPresentingEditRecordsSheet: Bool
    
    var body: some View {
        let df: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
            return formatter
        }()
        List {
            Section(header: Text("Workout Records").foregroundColor(.white)) {
                HStack {
                    Spacer()
                    Text("Date")
                    Spacer()
                    Text("Weight")
                    Spacer()
                    Text("Reps")
                    Spacer()
                    Text("Sets")
                    Spacer()
                }.bold()
                ForEach($records) { $record in
                    NavigationLink(destination: EditRecordSheet(workoutDay: $workoutDay, record: $record, records: $records, isPresentingEditRecordsSheet: $isPresentingEditRecordsSheet)
                        .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") {
                                records.sort {
                                    $0.date < $1.date
                                }
                                isPresentingEditRecordsSheet = false
                            }
                        }
                    }
                    ) {
                        HStack {
                            Spacer()
                            Text(df.string(from: record.date))
                            Spacer()
                            Text(String(record.weight))
                            Spacer()
                            Text(String(record.reps))
                            Spacer()
                            Text(String(record.sets))
                            Spacer()
                        }
                    }
                }
                .onDelete{
                    records.remove(atOffsets: $0)
                    let allRecords = workoutDay.workouts.flatMap({ workout in
                        workout.records
                    })
                    workoutDay.lastWorkoutDay = allRecords.max(by: { recordOne,recordTwo  in
                        recordOne.date < recordTwo.date
                    })?.date ?? Date.distantPast
                }
            }
            .listRowSeparatorTint(.yellow)
            .foregroundColor(Color("angelYellow"))
            .listRowBackground(
                Color("royalBlueLight")
            )
        }
        .scrollContentBackground(.hidden)
        .background(Color("royalBlue"))
        
        .onAppear {
//            records = sortedRecords
            records.sort {
                $0.date > $1.date
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        EditRecordsSheet(workoutDay: .constant(WorkoutDay.sampleData[0]), records: .constant(WorkoutDay.records), isPresentingEditRecordsSheet: .constant(true))
    }
}
