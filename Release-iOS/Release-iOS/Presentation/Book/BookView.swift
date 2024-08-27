//
//  BookView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct BookView: View {
    
    @EnvironmentObject var tabBarState: TabBarState
    
    @State private var bookData: [BookDTO] = book1
    
    var body: some View {
        NavigationView {
            VStack {
                
                leadingNavigationView(for: StringLiterals.Navigation.book)
                
                List(bookData) { book in
                    ZStack {
                        NavigationLink(destination: BookDetailView(book: book)) {
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
                tabBarState.isTabBarHidden = false
            }
        }
    }
}
