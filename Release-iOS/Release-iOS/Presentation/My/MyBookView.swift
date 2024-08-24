//
//  MyBookView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct MyBookView: View {
    
    @Binding var isTabBarHidden: Bool
    @Environment(\.presentationMode) var presentationMode
    @State private var book: [BookDTO] = book1
    
    var body: some View {
        VStack {
            
            centerNavigationView(for: StringLiterals.Navigation.bookCheck,
                                 presentationMode: presentationMode)
            
            List(book) { book in
                ZStack {
                    NavigationLink(
                        destination: BookDetailView(
                            book: book,
                            isTabBarHidden: $isTabBarHidden)) {
                                EmptyView()
                            }
                            .opacity(0.0)
                    bookCell(for: book)
                }
                .listRowBackground(Color.black1)
            }
            .listStyle(PlainListStyle())
        }
        .background(Color.black1)
        .navigationBarHidden(true)
        .toolbar(.hidden, for: .tabBar)
        .onAppear {
            isTabBarHidden = true
        }
    }
}
