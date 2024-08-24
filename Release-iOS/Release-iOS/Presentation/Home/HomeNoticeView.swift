//
//  HomeNoticeView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/24/24.
//

import SwiftUI

struct HomeNoticeView: View {

    @Binding var isTabBarHidden: Bool
    @Environment(\.presentationMode) var presentationMode
    
    let notices: [Notice] = notice1
    
    var body: some View {
        VStack {
            
            centerNavigationView(for: StringLiterals.Navigation.notice,
                                 presentationMode: presentationMode)
            
            List(notices) { notice in 
                HomeNoticeViewCell(notice: notice)
            }
            .listRowSeparator(.hidden)
            .padding(.horizontal, 24)
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .background(Color.black1)
        .onAppear {
            isTabBarHidden = true
        }
    }
}
