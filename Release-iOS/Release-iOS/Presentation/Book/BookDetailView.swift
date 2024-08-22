//
//  BookDetailView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/21/24.
//

import SwiftUI

struct BookDetailView: View {
    
    let book: BookDTO
    @Environment(\.presentationMode) var presentationMode
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack {
                ScrollView() {
                    VStack {
                        ZStack {
                            Image(book.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                                .blur(radius: 2)
                                .opacity(0.8)
                            
                            VStack{
                                Spacer()
                                HStack{
                                    Spacer()
                                    
                                    Image(book.image)
                                        .resizable()
                                        .frame(width: 180, height: 254)
                                    
                                    Spacer()
                                }
                                .padding(.bottom, 48)
                            }
                        }
                        .padding(.bottom, 32)
                        
                        VStack(alignment: .leading) {
                            Text(book.status.rawValue)
                                .font(.paragraph3)
                                .foregroundColor(Color.black2)
                                .padding(.horizontal, 17)
                                .padding(.vertical, 3.5)
                                .background(
                                    if book.status == BookStatus.available {
                                        Color.primary1
                                    } else {
                                        Color.primary2
                                    }
                                )
                                .cornerRadius(8)
                                .padding(.bottom, 8)
                            
                            HStack {
                                Text(StringLiterals.Book.date)
                                    .font(.paragraph2)
                                    .foregroundColor(.primary1)
                                    .padding(.trailing, 0.5)
                                
                                //TODO: 시작과 마감 기한 추가
                            }
                            .padding(.bottom, 24)
                            
                            Text(book.title)
                                .font(.heading3)
                                .foregroundColor(.gray1)
                                .padding(.bottom, 16)
                            
                            Text(book.author)
                                .font(.paragraph1)
                                .foregroundColor(.gray3)
                                .padding(.bottom, 16)
                            
                            Text(book.tag)
                                .font(.paragraph2)
                                .foregroundColor(.gray5)
                        }
                        .padding(.horizontal, 24)
                        .padding(.bottom, 40)
                    }
                    .background(Color.black1)
                }
                
                VStack(alignment: .center) {  
                    Button(action: {
                        print("버튼 탭💖\n")
                    }) {
                        if book.status == BookStatus.available {
                            Text(StringLiterals.Book.avaliable)
                                .font(.heading4)
                                .foregroundColor(.black2)
                                .padding(.horizontal, 68)
                                .padding(.vertical, 15)
                                .background(Color.primary1)
                                .cornerRadius(16)
                        } else {
                            Text(StringLiterals.Book.unavaliable)
                                .font(.heading4)
                                .foregroundColor(.black2)
                                .padding(.horizontal, 68)
                                .padding(.vertical, 15)
                                .background(Color.black1)
                                .cornerRadius(16)
                        }
                    }
                    .padding(.top, 13)
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width, height: 114)
                .background(Color.black2)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .shadow(color: Color.black1.opacity(0.2), radius: 16, x: 0, y: 4)
            }
            .background(Color.clear)
            
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
        .ignoresSafeArea(edges: .bottom)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .background(Color.black1)
        .onAppear {
            isTabBarHidden = true
        }
    }
}
