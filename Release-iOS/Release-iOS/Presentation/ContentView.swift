//
//  ContentView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selectedTab: Tab = .home
    @State private var isTabBarHidden: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Spacer()
            
            switch selectedTab {
            case .home:
                HomeView(eventsByDay: weekly1)
                    .padding(.bottom, 114+10)
            case .activity:
                ActivityView(navigationTitle: StringLiterals.Navigation.activity,
                             isTabBarHidden: $isTabBarHidden)
                .padding(.bottom, isTabBarHidden ? 0 : 114+10)
            case .book:
                BookView(navigationTitle: StringLiterals.Navigation.book,
                         isTabBarHidden: $isTabBarHidden)
                .padding(.bottom, isTabBarHidden ? 0 : 114+10)
            case .my:
                MyView(my: my1,
                       navigationTitle: StringLiterals.Navigation.my,
                       isTabBarHidden: $isTabBarHidden)
                .padding(.bottom, isTabBarHidden ? 0 : 114+10)
            }
            
            Spacer()
            
            if !isTabBarHidden {
                CustomTabView(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.black1)
    }
}

#Preview {
    ContentView()
}
