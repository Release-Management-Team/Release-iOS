//
//  BookView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    let image: String
    let status: String
    let title: String
    let author: String
    let year: String
    let publisher: String
}

struct BookView: View {
    
    @State private var bookData: [Book] = book1
    @Binding var isTabBarHidden: Bool
    
    var body: some View {
        NavigationView {
            VStack {
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
