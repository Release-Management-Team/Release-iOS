//
//  HomeView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                   Image("releaseLogo")
                        .frame(width: 80, height: 48)
                    
                    Spacer()
                    
                    Button(action: {
                        print("알람버튼 탭\n")
                    }) {
                        Image("icRing")
                    }
                    .frame(width: 32, height: 32)
                    
                    Image("kuromiDummy")
                         .frame(width: 48, height: 48)
                         .cornerRadius(24)
                         .padding(.leading, 8)
                }
                .padding(.vertical, 12)
                .padding(.bottom, 32)
                
                HStack {
                    Text("신지원 님,\n오늘도 버그없는 개발 되세요!")
                        .font(.heading3)
                        .foregroundColor(.gray1)
                }
                .padding(.bottom, 40)
                
                VStack {
                    HStack {
                        Text(StringLiterals.Home.notice)
                            .font(.heading3)
                            .foregroundColor(.primary1)
                            .padding(.bottom, 8)
                        
                        Spacer()
                    }
                    
                    VStack(alignment: .center) {
                        Text("⛔️ 16:00 ~ 18:00  랩실 출입 통제됩니다")
                            .font(.paragraph1)
                            .foregroundColor(.black2)
                            .padding(.vertical, 24)
                            .padding(.horizontal, 16)
                    }
                    .background(Color.primary1)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(16)
                }
                .padding(.bottom, 32)
                
                Text(StringLiterals.Home.weekly)
                    .font(.heading3)
                    .foregroundColor(.gray1)
                    .padding(.bottom, 8)
            }
        }
        .padding(.horizontal, 24)
    }
}
