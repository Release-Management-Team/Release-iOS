//
//  ContentView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        VStack {
            Spacer()
            
            switch selectedTab {
            case .home:
                HomeView()
            case .activity:
                ActivityView()
            case .book:
                BookView()
            case .my:
                MyView()
            }
            
            Spacer()
            
            CustomTabView(selectedTab: $selectedTab)
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.black1)
    }
}

#Preview {
    ContentView()
}
