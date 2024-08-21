//
//  MyInfoEditView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct MyInfoEditView: View {
    
    var navigationTitle: String
    @Binding var isTabBarHidden: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var my: My = my1
    
    @State private var statusValue: String = ""
    @State private var emailValue: String = ""
    @State private var phoneValue: String = ""
    
    var body: some View {
        VStack {
            
            centerNavigationView(for: StringLiterals.Navigation.infoEdit,
                                 presentationMode: presentationMode)
            
            ScrollView {
                VStack(alignment: .center) {
                    Image("kuromiDummy")
                        .frame(width: 96, height: 96)
                        .cornerRadius(48)
                        .background(Color.clear)
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                    
                    Text(my.name)
                        .font(.heading3)
                        .foregroundColor(.gray1)
                        .padding(.bottom, 40)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text(StringLiterals.My.studentNumber)
                                .padding(.bottom, 32)
                            Text(StringLiterals.My.major)
                                .padding(.bottom, 32)
                            Text(StringLiterals.My.period)
                        }
                        .font(.heading4)
                        .foregroundColor(.gray3)
                        
                        Spacer()
                        
                        VStack(alignment: .trailing) {
                            Text(String(my.studentNumber))
                                .padding(.bottom, 32)
                            Text(my.major)
                                .padding(.bottom, 32)
                            Text(my.period)
                                .padding(.bottom, 12)
                        }
                        .font(.heading4)
                        .foregroundColor(.gray4)
                    }
                    .padding(.bottom, 56)
                    
                    VStack(alignment: .leading) {
                        Text(StringLiterals.My.status)
                            .font(.heading4)
                            .foregroundColor(.gray3)
                            .padding(.bottom, 8)
                    }
                    .padding(.bottom, 32)
                    
                    VStack(alignment: .leading) {
                        Text(StringLiterals.My.email)
                            .font(.heading4)
                            .foregroundColor(.gray3)
                            .padding(.bottom, 8)
                        
                        CustomTextField(text: $emailValue, placeholder: my.email)
                    }
                    .padding(.bottom, 32)
                    
                    VStack(alignment: .leading) {
                        Text(StringLiterals.My.phone)
                            .font(.heading4)
                            .foregroundColor(.gray3)
                            .padding(.bottom, 8)
                        
                        CustomTextField(text: $phoneValue, placeholder: my.phone)
                    }
                    .padding(.bottom, 24)
                }
                .padding(.horizontal, 24)
            }
            .scrollIndicators(.hidden)
            
            VStack(alignment: .center) {  
                Button(action: {
                    print("버튼 탭💖\n")
                }) {
                    Text("수정 완료")
                        .font(.heading4)
                        .foregroundColor(.black2)
                        .padding(.horizontal, 68)
                        .padding(.vertical, 15)
                        .background(Color.primary1)
                        .cornerRadius(16)
                }
                .padding(.top, 13)
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 114)
            .background(Color.black2)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: Color.gray1.opacity(0.2), radius: 10, x: 0, y: 5)
        }
        .background(Color.black1)
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            isTabBarHidden = true
        }
    }
}
