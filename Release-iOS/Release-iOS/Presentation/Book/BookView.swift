//
//  BookView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct BookView: View {
    
    var navigationTitle: String
    @Binding var isTabBarHidden: Bool
    
    @State private var bookData: [BookDTO] = book1
    
    var body: some View {
        NavigationView {
            VStack {
                
                leadingNavigationView(for: navigationTitle)
                
                List(bookData) { book in
                    ZStack {
                        NavigationLink(destination:
                                        BookDetailView(
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
            .onAppear {
                isTabBarHidden = false
            }
        }
    }
}
