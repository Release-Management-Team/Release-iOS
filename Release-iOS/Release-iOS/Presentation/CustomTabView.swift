//
//  CustomTabView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

enum Tab {
    case home
    case activity
    case book
    case my
}

struct CustomTabView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        GeometryReader { geometry in
            let buttonWidth = (geometry.size.width - 48) / 4
            HStack(spacing: 0) {       
                tabButton(tab: .home, image: "icHome", text: "홈", width: buttonWidth)            
                tabButton(tab: .activity, image: "icStudy", text: "활동", width: buttonWidth)        
                tabButton(tab: .book, image: "icBook", text: "도서", width: buttonWidth)
                tabButton(tab: .my, image: "icProfile", text: "마이페이지", width: buttonWidth)
            }
            .frame(width: UIScreen.main.bounds.width, height: 96)
            .background(Color.black2)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .frame(width: UIScreen.main.bounds.width, height: 96)
    }
    
    private func tabButton(tab: Tab, image: String, text: String, width: CGFloat) -> some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack {
                Image(image)
                    .renderingMode(.template)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 24, height: 24)
                    .foregroundColor(selectedTab == tab ? .primary1 : .gray1)
                Text(text)
                    .font(.paragraph3)
                    .foregroundColor(selectedTab == tab ? .primary1 : .gray1)
            }
            .frame(width: width)
        }
    }
}
