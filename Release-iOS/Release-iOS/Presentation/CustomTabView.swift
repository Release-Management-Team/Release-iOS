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
            VStack {
                HStack(spacing: 0) {       
                    tabButton(tab: .home, image: "icHome", text: "홈", width: buttonWidth)            
                    tabButton(tab: .activity, image: "icStudy", text: "활동", width: buttonWidth)        
                    tabButton(tab: .book, image: "icBook", text: "도서", width: buttonWidth)
                    tabButton(tab: .my, image: "icProfile", text: "마이페이지", width: buttonWidth)
                }
                .padding(.top, 18)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 114)
            .background(Color.black2)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: Color.gray1.opacity(0.15), radius: 10, x: 0, y: 10)
        }
        .frame(width: UIScreen.main.bounds.width, height: 114)
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

func leadingNavigationView(for title: String) -> some View {
    HStack {
        Text(title)
            .font(.heading3)
            .foregroundColor(.gray1)
            .padding(.leading, 24)
        
        Spacer()
    }
    .frame(width: UIScreen.main.bounds.width, height: 72)
}

func centerNavigationView(for title: String, presentationMode: Binding<PresentationMode>, isTabBarHidden: Binding<Bool>) -> some View {
    HStack(alignment: .center) {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
            isTabBarHidden.wrappedValue = false
            
        }) {
            Image("icArrow")
                .foregroundColor(.white)
                .frame(width: 24, height: 24)
                .background(Color.clear)
        }
        .padding(.leading, 24)
        
        Spacer()
        
        Text(title)
            .font(.heading4)
            .foregroundColor(.gray1)
        
        Spacer()
    }
    .frame(width: UIScreen.main.bounds.width, height: 72)
}
