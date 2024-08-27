//
//  ActivityView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct ActivityView: View {
    
    @EnvironmentObject var tabBarState: TabBarState
    
    @State private var isStudy = true
    @State private var selectedCategory = StringLiterals.Activity.study
    
    @State private var activityData: [ActivityDTO] = activities1
    @State private var eventData: [EventDTO] = event1
    
    var body: some View {
        NavigationView {
            VStack {
                
                leadingNavigationView(for: StringLiterals.Navigation.activity)
                
                HStack(spacing: 0) {
                    Button(action: {
                        selectedCategory = StringLiterals.Activity.study
                        isStudy = true
                    }) {
                        Text(StringLiterals.Activity.study)
                            .font(.heading4)
                            .foregroundColor(selectedCategory == StringLiterals.Activity.study ? Color.black1 : Color.gray5)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity)
                            .background(selectedCategory == StringLiterals.Activity.study ? Color.primary1 : Color.black2)
                            .cornerRadius(32)
                    }
                    
                    Button(action: {
                        selectedCategory = StringLiterals.Activity.event
                        isStudy = false
                    }) {
                        Text(StringLiterals.Activity.event)
                            .font(.heading4)
                            .foregroundColor(selectedCategory == StringLiterals.Activity.event ? Color.black1 : Color.gray5)
                            .padding(.vertical, 7)
                            .frame(maxWidth: .infinity)
                            .background(selectedCategory == StringLiterals.Activity.event ? Color.primary1 : Color.black2)
                            .cornerRadius(32)
                    }
                }
                .padding(8)
                .background(Color.black2)
                .cornerRadius(32)
                .padding(.horizontal, 24)
                
                if isStudy {
                    List(activityData) { activity in
                        ZStack {
                            NavigationLink(destination: ActivityDetailView(activity: activity)) {
                                EmptyView()
                            }
                            .opacity(0.0)
                            activityCell(for: activity)
                        }
                        .listRowBackground(Color.black1)
                    }
                    .listStyle(PlainListStyle())
                } else {
                    List(eventData) { event in
                        eventCell(for: event)
                    }
                    .listRowBackground(Color.black1)
                    .listStyle(PlainListStyle())
                }
            }
            .background(Color.black1)
        }
        .padding(.bottom, 114+10)
        .background(Color.black1)
        .onAppear {
            tabBarState.isTabBarHidden = false
        }
    }
}
