//
//  MyPageView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct My: Identifiable {
    let id = UUID()
    let name: String
    let staff: Bool
    let status: String
    let studentNumber: Int
    let major: String
    let period: String
    let email: String
    let phone: String
}

struct MyView: View {
    
    var my: My
    var navigationTitle: String
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(my.name)
                                .font(.heading3)
                                .foregroundColor(.gray1)
                                .padding(.top, 65)
                                .padding(.trailing, 23)
                            
                            if my.staff {
                                Text(StringLiterals.My.staff)
                                    .font(.paragraph3)
                                    .foregroundColor(.primary1)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 3)
                                    .background(Color.clear)
                                    .cornerRadius(8)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 8)
                                            .stroke(Color.primary1, lineWidth: 1)
                                    )
                            }
                        }
                        .padding(.bottom, 8)
                        
                        HStack {
                            Text(my.status)
                                .font(.paragraph1)
                                .foregroundColor(.gray3)
                        }
                        .padding(.bottom, 24)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text(StringLiterals.My.studentNumber)
                                    .padding(.bottom, 12)
                                Text(StringLiterals.My.major)
                                    .padding(.bottom, 12)
                                Text(StringLiterals.My.period)
                                    .padding(.bottom, 12)
                                Text(StringLiterals.My.email)
                                    .padding(.bottom, 12)
                                Text(StringLiterals.My.phone)
                                    .padding(.bottom, 12)
                            }
                            .font(.paragraph2)
                            .foregroundColor(.gray3)
                            .padding(.trailing, 32)
                            
                            VStack(alignment: .leading) {
                                Text(String(my.studentNumber))
                                    .padding(.bottom, 12)
                                Text(my.major)
                                    .padding(.bottom, 12)
                                Text(my.period)
                                    .padding(.bottom, 12)
                                Text(my.email)
                                    .padding(.bottom, 12)
                                Text(my.phone)
                                    .padding(.bottom, 12)
                            }
                            .font(.paragraph2)
                            .foregroundColor(.gray5)
                            
                            Spacer()
                        }
                    }
                    .background(Color.black2)
                    .cornerRadius(16)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.primary1, lineWidth: 1)
                    )
                    
                    Image("kuromiDummy")
                        .frame(width: 96, height: 96)
                        .background(Color.clear)
                        .padding(.leading, 8)
                }
                
                VStack {
                    Text(StringLiterals.My.goal)
                        .font(.heading4)
                        .foregroundColor(.gray1)
                        .padding([.leading, .bottom], 8)
                    
                    HStack {
                        Spacer()
                        
                        Text("학회원 자격 조건을 달성하였습니다!")
                            .font(.paragraph1)
                            .foregroundColor(.gray4)
                            .padding(.horizontal, 16)
                        
                        Spacer()
                    }
                    .background(Color.black2)
                    .cornerRadius(16)
                }
                .padding(.bottom, 32)
                
                VStack {
                    Text(StringLiterals.My.check)
                        .font(.heading4)
                        .foregroundColor(.gray1)
                        .padding([.leading, .bottom], 8)
                    
                    Button(action: {
                        print("참여 중인 스터디/프로젝트 확인하기\n")
                    }) {
                        Text(StringLiterals.My.activityCheck)
                            .font(.paragraph1)
                            .foregroundColor(.black2)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .background(.primary1)
                            .cornerRadius(16)
                    }
                    .padding(.bottom, 8)
                    
                    Button(action: {
                        print("대여 중인 도서 확인하기\n")
                    }) {
                        Text(StringLiterals.My.bookCheck)
                            .font(.paragraph1)
                            .foregroundColor(.black2)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .background(.primary1)
                            .cornerRadius(16)
                    }
                }
                .padding(.bottom, 32)
                
                VStack {
                    Text(StringLiterals.My.edit)
                        .font(.heading4)
                        .foregroundColor(.gray1)
                        .padding([.leading, .bottom], 8)
                    
                    Button(action: {
                        print("참여 중인 스터디/프로젝트 확인하기\n")
                    }) {
                        Text(StringLiterals.My.infoEdit)
                            .font(.paragraph1)
                            .foregroundColor(.gray3)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .background(.black2)
                            .cornerRadius(16)
                    }
                    .padding(.bottom, 8)
                    
                    Button(action: {
                        print("대여 중인 도서 확인하기\n")
                    }) {
                        Text(StringLiterals.My.passwordEdit)
                            .font(.paragraph1)
                            .foregroundColor(.gray3)
                            .padding(.horizontal, 16)
                            .frame(maxWidth: .infinity)
                            .background(.black2)
                            .cornerRadius(16)
                    }
                }
                .padding(.bottom, 24)
            }
        }
        .padding(.horizontal, 24)
    }
}
