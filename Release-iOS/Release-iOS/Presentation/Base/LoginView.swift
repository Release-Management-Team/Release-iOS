//
//  LoginView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/28/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var id : String = ""
    @State private var password : String = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                
                Image("releaseBigLogo")
                    .resizable()
                    .background(Color.clear)
                    .frame(height: 113)
                    .padding(.top, 101)
                    .padding(.horizontal, 101)
                    .padding(.bottom, 56)
                
                CustomTextField(text: $id,
                                placeholder: StringLiterals.Login.id,
                                type: .numberPad)
                .padding(.horizontal, 24)
                .padding(.bottom, 16)
                
                CustomSecureTextField(text: $password,
                                      placeholder: StringLiterals.Login.password)
                .padding(.horizontal, 24)
                .padding(.bottom, 48)
                
                NavigationLink(
                    destination: TabBarView()) {
                        Text(StringLiterals.Login.buttonTitle)
                            .font(.heading4)
                            .foregroundColor(.black2)
                            .padding(.vertical, 15)
                            .frame(maxWidth: .infinity)
                            .background(.primary1)
                            .cornerRadius(16)
                    }
                    .padding(.horizontal, 24)
                
                    Spacer()
                
            }
            .background(Color.black1)
        }
    }
}

