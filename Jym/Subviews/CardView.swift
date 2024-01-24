//
//  CardView.swift
//  Jym
//
//  Created by John Smith on 5/24/23.
//

import SwiftUI

struct CardView: View {
    @Binding var workoutDay: WorkoutDay
    let width = UIScreen.main.bounds.size.width
    let height = UIScreen.main.bounds.size.height
    let cornerRadius: CGFloat = 10
    let subtitleSize: CGFloat = 20
    let smallFont: CGFloat = 15
    let dateSize: CGFloat = 10
    let outlineSize: CGFloat = 2
    let emojiSize: CGFloat = 32
    var body: some View {
        let df: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd/yy")
            return formatter
        }()
        let dfWeek: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("EEEE")
            return formatter
        }()
        HStack {
            ZStack{
//                Circle()
//                    .foregroundColor(Color("royalBlue"))
//                    .frame(width: width*0.13, height: width*0.13, alignment: .center)
////                    .opacity(0.5)
                Text(workoutDay.emoji)
                    .font(.system(size: emojiSize))
            }
            .padding([.trailing, .leading])
            VStack {
                HStack {
                    Text(workoutDay.name)
                        .bold()
//                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    Spacer()
                }
//                Spacer()
//                    .frame(height: 7)
//                HStack{
//                    Image(systemName: "flame")
//                    Text(String(workoutDay.streak))
//                    Text("Weeks")
//                    Spacer()
//                }
                .font(.system(size: smallFont))
            }
            Spacer()
            VStack {
                HStack {
                    let weekAgo = Calendar.current.date(byAdding: .day, value: -6, to: Date())
                    if workoutDay.lastWorkoutDay > weekAgo! {
                        Text(dfWeek.string(from: workoutDay.lastWorkoutDay))
                    }
                    else {
                        Text(df.string(from: workoutDay.lastWorkoutDay))
                    }
                }
                .font(.system(size: smallFont))
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                NavigationLink {
                    Text("hi")
                } label: {
                    CardView(workoutDay: .constant(WorkoutDay.sampleData[0]))
                }
                .listRowSeparatorTint(.yellow)
                .foregroundColor(Color("gold"))
                .listRowBackground(
                    Color("royalBlueLight")
            
                )
            }
            .scrollContentBackground(.hidden)
            .background(
                Color("royalBlue")
            )
            
        }
        
    }
    
}
