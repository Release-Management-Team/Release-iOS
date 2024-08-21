//
//  HomeWeeklyEventView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct WeeklyEvent {
    let id = UUID()
    let category: String
    let title: String
    let time: String
}

struct HomeWeeklyView: View {
    let weekly = ["월", "화", "수", "목", "금", "토", "일"]
    let eventsByDay: [[WeeklyEvent]]
    
    var body: some View {
        TabView {
            ForEach(eventsByDay, id: \.id) { event in
                HomeWeeklyViewCell(event: event)
                    .padding()
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
