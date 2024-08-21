//
//  MyActivityView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct MyActivityView: View {
    
    var navigationTitle: String
    @Binding var isTabBarHidden: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var activityData: [Activity] = activities1
    
    var body: some View {
        VStack {
            
            centerNavigationView(for: StringLiterals.Navigation.activityCheck,
                                 presentationMode: presentationMode,
                                 isTabBarHidden: $isTabBarHidden)
            
            List(activityData) { activity in
                ZStack {
                    NavigationLink(
                        destination: ActivityDetailView(
                            activity: activity,
                            isTabBarHidden: $isTabBarHidden)) {
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
            isTabBarHidden = true
        }
    }
}
