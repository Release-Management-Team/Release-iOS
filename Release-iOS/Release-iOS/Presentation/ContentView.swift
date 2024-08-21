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
                HomeView()
                    .padding(.bottom, 96)
            case .activity:
                ActivityView(isTabBarHidden: $isTabBarHidden)
                    .padding(.bottom, isTabBarHidden ? 0 : 96)
            case .book:
                BookView()
                    .padding(.bottom, 96)
            case .my:
                MyView()
                    .padding(.bottom, 96)
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
