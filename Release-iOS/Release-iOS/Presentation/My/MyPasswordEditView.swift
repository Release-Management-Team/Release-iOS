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
    
    @State private var passwordIsNotSame: Bool = false
    @State private var passwordIsNotValid: Bool = false
    
    @State private var currentPassword : String = ""
    @State private var newPassword : String = ""
    @State private var checkPassword : String = ""
    
    var body: some View {
        VStack {
            
            centerNavigationView(for: StringLiterals.Navigation.passwordEdit,
                                 presentationMode: presentationMode,
                                 isTabBarHidden: $isTabBarHidden)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(StringLiterals.My.currentPassword)
                        .font(.heading4)
                        .foregroundColor(.gray3)
                        .padding(.bottom, 16)
                    
                    CustomSecureTextField(text: $currentPassword)
                }
                .padding(.bottom, 32)
                
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
                    
                    CustomSecureTextField(text: $newPassword)
                        .border(.primary4, width: passwordIsNotValid ? 1 : 0)
                        .padding(.bottom, 16)
                    
                    if passwordIsNotValid {
                        Text(StringLiterals.My.warningPassword)
                            .font(.paragraph3)
                            .foregroundColor(.primary4)
                    }
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
                    
                    CustomSecureTextField(text: $checkPassword)
                        .border(.primary4, width: passwordIsNotSame ? 1 : 0)
                        .padding(.bottom, 16)
                    
                    if passwordIsNotSame {
                        Text(StringLiterals.My.isNotSame)
                            .font(.paragraph3)
                            .foregroundColor(.primary4)
                    }
                }
                .padding(.bottom, 40)
                
                Spacer()
            }
            .padding(.horizontal, 24)
            
            VStack(alignment: .center) {  
                Button(action: {
                    print("버튼 탭💖\n")
                    checkSamePassword()
                    checkValidPassword(text: newPassword)
                }) {
                    Text(StringLiterals.My.changePassword)
                        .font(.heading4)
                        .foregroundColor(.black2)
                        .padding(.horizontal, 68)
                        .padding(.vertical, 15)
                        .background(!isAbleChangeButton() ? Color.primary1 : Color.black3)
                        .cornerRadius(16)
                }
                .padding(.top, 13)
                .disabled(!isAbleChangeButton())
                
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width, height: 114)
            .background(Color.black2)
            .clipShape(RoundedRectangle(cornerRadius: 16))
            .shadow(color: Color.black1.opacity(0.2), radius: 16, x: 0, y: 4)
        }
        .background(Color.black1)
        .ignoresSafeArea(edges: .bottom)
        .background(Color.black1)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            isTabBarHidden = true
        }
    }
    
    private func checkSamePassword() {
        var isSame = newPassword == checkPassword
        passwordIsNotSame = !isSame
    }
    
    private func checkValidPassword(text: String) {
        let pattern = "^[A-Za-z0-9]{8,20}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", pattern)
        var isValid = predicate.evaluate(with: text)
        passwordIsNotValid = !isValid
    }
    
    private func isAbleChangeButton() -> Bool {
        if newPassword != "" && newPassword != "" {
            return true
        } else {
            return false
        }
    }
}
