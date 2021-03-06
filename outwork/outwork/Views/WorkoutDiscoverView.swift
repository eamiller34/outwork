//
//  WorkoutDiscoverView.swift
//  outwork
//
//  Created by Erik Miller on 11/4/20.
//

import SwiftUI

struct WorkoutDiscoverView: View {
    @ObservedObject var workoutStore = WorkoutStore()
    @State var workout = Workout.mockWorkout
    var workoutResult = WorkoutResult()
    
var body: some View { 
            NavigationView {
                VStack {
                    VStack(alignment: .leading){
                        Text("Popular Workouts")
                            .padding(.leading)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                            ForEach(0...5, id: \.self) { index in
                                Button(action: {}, label: {
                                        VStack(alignment: .leading){
                                            Text("Title")
                                                .padding(.bottom, 10)
                                                .font(.title3)
                                            Text("Workout Description")
                                                .padding(.bottom, 10)
                                                .font(.caption)
                                                .foregroundColor(.secondary)
                                            HStack{
                                                Spacer()
                                            Text("Add Workout")
                                                .font(.caption)
                                            }
                                        }.frame(minWidth: 100)
                                        .padding()
                                        .cornerRadius(20)
                                        .overlay(
                                                RoundedRectangle(cornerRadius: 16)
                                                    .stroke(Color.pink, lineWidth: 2)
                                            )
                                })
                            }.padding(.horizontal, 8).foregroundColor(.pink)
                            }.padding(EdgeInsets(top: 10, leading: 12, bottom: 20, trailing: 12))
                            
                        }
                    }
                    Divider()
                            VStack(alignment: .leading){
                                Text("This Week's Activity")
                                
                                HStack {
                                    Text("\(workoutStore.formattedTotalTime()) hours")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Spacer()
                                    Label("0:30 hours", systemImage: "arrow.up")
                                        .padding(10)
                                        .font(.caption)
                                        .background(Capsule().fill(Color.pink))
                                        .frame(maxWidth: 150)
                                    
                                }.padding(.top)
                            }.padding()

                    Divider()
                    VStack(alignment: .leading){
                        HStack {
                            Text("\(workoutStore.workoutResults.totalReps(workoutReps: workoutResult.workoutResultReps)) reps")
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                            Label("50 reps", systemImage: "arrow.up")
                                .padding(10)
                                .font(.caption)
                                .background(Capsule().fill(Color.pink))
                                .frame(maxWidth: 150)
                            
                        }
                    }.padding()
                    Divider()
                    Spacer()
                }.padding(.top).navigationTitle("Discover")
            }
        }
    }


struct WorkoutDiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        WorkoutDiscoverView()
    }
}
