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
    @State private var dynamicHeight = 0
    
    var body: some View {
        ScrollView {
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
                .padding(.bottom, 8)
                .background(Color.clear)
                
                TabView(selection: $selectedDay) {
                    ForEach(0 ..< weeklyDay.count) { index in
                        if eventsByDay[index].isEmpty {
                            VStack(alignment: .center) {
                                ForEach(weekEmpty) { event in
                                    HomeWeeklyEmptyViewCell(event: event)
                                        .listRowBackground(Color.clear)
                                        .padding(.vertical, 4)
                                }
                            }
                            .tag(index)
                            
                        } else {
                            VStack(alignment: .center) {
                                ForEach(eventsByDay[index]) { event in
                                    HomeWeeklyViewCell(event: event)
                                        .listRowBackground(Color.clear)
                                        .padding(.vertical, 4)
                                }
                            }
                            .tag(index)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: dynamicHeight(for: selectedDay))
            }
        }
    }
    
    private func getButtonColor(for index: Int) -> Color {
        if selectedDay == index {
            return Color.primary1
        } else {
            if eventsByDay[index].isEmpty {
                return Color.black2
            } else {
                return Color.gray2
            }
        }
    }
    
    private func dynamicHeight(for dayIndex: Int) -> CGFloat {
        if eventsByDay[dayIndex].isEmpty {
            return CGFloat(150)
        } else {
            let eventCount = eventsByDay[dayIndex].count
            let baseHeight: CGFloat = 150
            return CGFloat(eventCount) * (baseHeight + 8)
        }
    }
    
}
