//
//  BookDetailView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/21/24.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: Book
    @Environment(\.presentationMode) var presentationMode
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView() {
                VStack {
                    ZStack {
                        Image("kuromiDummy")
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                            .blur(radius: 2)
                            .opacity(0.8)
                        
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                
                                Image("kuromiDummy")
                                    .resizable()
                                    .frame(width: 180, height: 254)
                                
                                Spacer()
                            }
                            .padding(.bottom, 48)
                        }
                    }
                    .padding(.bottom, 32)
                    
                    VStack(alignment: .leading) {
                        Text(book.status)
                            .font(.paragraph3)
                            .foregroundColor(Color.black2)
                            .padding(.horizontal, 17)
                            .padding(.vertical, 3.5)
                            .background(Color.primary1)
                            .cornerRadius(8)
                            .padding(.bottom, 8)
                        
                        Text("대여가능 날짜")
                            .font(.paragraph2)
                            .foregroundColor(.primary1)
                            .padding(.bottom, 24)
                        
                        Text(book.title)
                            .font(.heading3)
                            .foregroundColor(.gray1)
                            .padding(.bottom, 16)
                        
                        Text(book.author)
                            .font(.paragraph1)
                            .foregroundColor(.gray3)
                            .padding(.bottom, 16)
                        
                        HStack {
                            Text(book.year)
                                .font(.paragraph2)
                                .foregroundColor(.gray5)
                                .padding(.trailing, 1)
                            
                            Text(book.publisher)
                                .font(.paragraph2)
                                .foregroundColor(.gray5)
                        }
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
        .onAppear {
            isTabBarHidden = true
        }
        .onDisappear {
            isTabBarHidden = false
        }
    }
}

