//
//  MyPasswordEditView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct MyPasswordEditView: View {
    
    var navigationTitle: String
    @Binding var isTabBarHidden: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var my: My = my1
    
    @State private var newPassword : String = ""
    @State private var checkPassword : String = ""
    
    var body: some View {
        VStack {
            
            centerNavigationView(for: StringLiterals.Navigation.passwordEdit,
                                 presentationMode: presentationMode,
                                 isTabBarHidden: $isTabBarHidden)
            
            ScrollView {
                VStack(alignment: .leading) {
                    
                    VStack(alignment: .leading) {
                        HStack(alignment: .center) {
                            Text(StringLiterals.My.newPassword)
                                .font(.heading4)
                                .foregroundColor(.gray3)
                            
                            Spacer()
                            
                            Text(StringLiterals.My.passwordCondition)
                                .font(.paragraph3)
                                .foregroundColor(.gray5)
                        }
                        .padding(.bottom, 16)
                        
                        CustomTextField(text: $newPassword,
                                        placeholder: "",
                                        type: .default)
                    }
                    .padding(.bottom, 32)
                    
                    Text(StringLiterals.My.warningPassword)
                        .font(.paragraph3)
                        .foregroundColor(.primary4)
                        .padding(.bottom, 24)
                    
                    VStack(alignment: .leading) {
                        Text(StringLiterals.My.checkPassword)
                            .font(.heading4)
                            .foregroundColor(.gray3)
                            .padding(.bottom, 16)
                        
                        CustomTextField(text: $checkPassword,
                                        placeholder: "",
                                        type: .default)
                    }
                    .padding(.bottom, 32)
                    
                    Spacer()
                }
            }
            
            VStack(alignment: .center) {  
                Button(action: {
                    print("버튼 탭💖\n")
                }) {
                    Text(StringLiterals.My.changePassword)
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
        .padding(.horizontal, 24)
        .background(Color.black1)
        .ignoresSafeArea(edges: .bottom)
        .background(Color.black1)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            isTabBarHidden = true
        }
    }
}

