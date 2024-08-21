//
//  HomeWeeklyEventView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct WeeklyEvent: Identifiable {
    let id = UUID()
    let category: String
    let title: String
    let time: String
}

struct HomeWeeklyView: View {
    
    let weeklyDay = StringLiterals.Home.weeklyDay
    let eventsByDay: [[WeeklyEvent]]
    
    @State private var selectedDay = 0
    
    var body: some View {
        VStack {
            HStack {
                ForEach(0 ..< weeklyDay.count) { index in
                    Button(action: {
                        selectedDay = index
                    }) {
                        Text(weeklyDay[index])
                            .font(.paragraph1)
                            .foregroundColor(getButtonColor(for: index))
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.clear)
                }
            }
            .background(Color.clear)
            
            TabView(selection: $selectedDay) {
                ForEach(0 ..< weeklyDay.count) { index in
                    VStack {
                        if eventsByDay[index].isEmpty {
                            Text("없숩니다")
                                .font(.heading0)
                                .foregroundColor(.clear)
                                .padding()
                        } else {
                            List {
                                ForEach(eventsByDay[index]) { event in
                                    HomeWeeklyViewCell(event: event)
                                        .listRowBackground(Color.black1)
                                }
                            }
                            .listStyle(PlainListStyle())
                            .scrollIndicators(.hidden)
                        }
                    }
                    .tag(index)
                    .padding(.top)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: )
        }
        .padding()
    }
    
    private func getButtonColor(for index: Int) -> Color {
        if selectedDay == index {
            return Color.primary1
        } else if eventsByDay[index].isEmpty {
            return Color.black2
        } else {
            return Color.gray2
        }
    }
}
