//
//  TabView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/28/24.
//

import SwiftUI

class TabBarState: ObservableObject {
    @Published var isTabBarHidden: Bool = false
}

struct TabBarView: View {
    
    @State private var selectedTab: Tab = .home
    @StateObject private var tabBarState = TabBarState()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Spacer()
            
            switch selectedTab {
            case .home:
                HomeView()
                    .padding(.bottom, tabBarState.isTabBarHidden ? 0 : 114+10)
            case .activity:
                ActivityView()
            case .book:
                BookView()
                    .padding(.bottom, tabBarState.isTabBarHidden ? 0 : 114+10)
            case .my:
                MyView(my: my1)
                    .padding(.bottom, tabBarState.isTabBarHidden ? 0 : 114+10)
            }
            
            Spacer()
            
            if !tabBarState.isTabBarHidden {
                CustomTabView(selectedTab: $selectedTab)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.black1)
        .environmentObject(tabBarState)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
    }
}
