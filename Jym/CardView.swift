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
    let dateSize: CGFloat = 15
    let outlineSize: CGFloat = 2
    let emojiSize: CGFloat = 30
    var body: some View {
        let df: DateFormatter = {
            let formatter = DateFormatter()
            formatter.setLocalizedDateFormatFromTemplate("M/dd")
            return formatter
        }()
        Rectangle()
            .fill(.linearGradient(
                Gradient(colors:[Color("royalBlueLight"), Color("royalBlueLight").opacity(0.5)]),
            startPoint: UnitPoint(x: 0, y: 0.5),
            endPoint: UnitPoint(x: 1, y: 0.5)
        ))
            .aspectRatio(1.5, contentMode: .fill)
            .cornerRadius(cornerRadius)
            .overlay(
                    VStack {
                        HStack {
                            Text(workoutDay.name)
                                .foregroundColor(Color("yellowText"))
                                .bold()
                            Spacer()
                        }
                        HStack {
                            ZStack {
                                Circle()
                                    .foregroundColor(Color("royalBlue"))
                                    .frame(width: width*0.15, height: width*0.15, alignment: .center)
                                Text(workoutDay.emoji)
                                    .font(.system(size: 30))
                            }
                            Spacer()
                            VStack {
                                HStack {
                                    Spacer()
                                    Image(systemName: "flame")
                                    Text(String(workoutDay.streak))
                                }
                                HStack {
                                    Spacer()
                                    Text(df.string(from: workoutDay.lastWorkoutDay))
                                }
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                        .padding()
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(workoutDay: .constant(WorkoutDay.sampleData[0]))
    }
}
