//
//  ActivityDetailView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/15/24.
//

import SwiftUI

struct ActivityDetailView: View {
    
    let activity: Activity
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView() {
                VStack {
                    Image("kuromiDummy")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                        .padding(.bottom, 31)
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text(activity.category)
                                .font(.paragraph2)
                                .foregroundColor(.gray5)
                            
                            Spacer()
                            
                            Text(activity.status)
                                .font(.paragraph3)
                                .foregroundColor(Color.black2)
                                .padding(.horizontal, 17)
                                .padding(.vertical, 3.5)
                                .background(Color.primary1)
                                .cornerRadius(8)
                        }
                        .padding(.bottom, 13)
                        
                        Text(activity.title)
                            .font(.heading4)
                            .foregroundColor(.gray1)
                        
                        Text(activity.content)
                            .font(.paragraph1)
                            .foregroundColor(.gray3)
                            .padding(.bottom, 8)
                        
                        Text(activity.person)
                            .font(.paragraph1)
                            .foregroundColor(.gray3)
                            .padding(.bottom, 48)
                        
                        Text("저희는 다양한 배경을 가진 사람들이 모여 프로그래밍 실력을 함께 향상시키는 것을 목표로 하고 있습니다. 주 1회 정기 모임을 통해 각자의 프로젝트를 공유하고, 문제 해결 방안을 논의하며, 최신 기술 동향에 대해 공부합니다. 초보자부터 전문가까지 누구나 참여 가능하며, 친근한 분위기 속에서 서로의 성장을 도울 수 있습니다. 함께 배우고 성장하며 네트워킹할 수 있는 기회를 놓치지 마세요.")
                            .font(.paragraph1)
                            .foregroundColor(.gray5)
                            .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 24)
                }
                .background(Color.black1)
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image("icArrow")
                    .foregroundColor(.white)
                    .frame(width: 48, height: 48)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(16)
            }
            .padding(.leading, 24)
            .padding(.top, 13)
        }
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .background(Color.black1)
    }
}
