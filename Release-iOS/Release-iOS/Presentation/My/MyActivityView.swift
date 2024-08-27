//
//  MyActivityView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct MyActivityView: View {
    
    @EnvironmentObject var tabBarState: TabBarState
    @Environment(\.presentationMode) var presentationMode
    
    @State private var activityData: [ActivityDTO] = activities1
    
    var body: some View {
        VStack {
            
            centerNavigationView(for: StringLiterals.Navigation.activityCheck,
                                 presentationMode: presentationMode)
            
            List(activityData) { activity in
                ZStack {
                    NavigationLink(
                        destination: ActivityDetailView(
                            activity: activity)) {
                                EmptyView()
                            }
                            .opacity(0.0)
                    activityCell(for: activity)
                }
                .listRowBackground(Color.black1)
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.black1)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            tabBarState.isTabBarHidden = true
        }
        .onDisappear {
            tabBarState.isTabBarHidden = false
        }
    }
}
