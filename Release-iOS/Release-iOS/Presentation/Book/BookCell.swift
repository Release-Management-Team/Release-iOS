//
//  ActivityCell.swift
//  Release-iOS
//
//  Created by 신지원 on 8/21/24.
//

import SwiftUI

func bookCell(for book: Book) -> some View {
    HStack {
        Image(book.image)
            .resizable()
            .frame(width: 88, height: 124)
            .padding(.trailing, 16)
        
        VStack(alignment: .leading) {
            Text(book.status)
                .font(.paragraph3)
                .foregroundColor(Color.black2)
                .padding(.horizontal, 17)
                .padding(.vertical, 3.5)
                .background(Color.primary1)
                .cornerRadius(8)
            
            Text(book.title)
                .font(.paragraph1)
                .foregroundColor(.gray1)
                .padding(.bottom, 8)
            
            Text(book.author)
                .font(.paragraph2)
                .foregroundColor(.gray3)
                .padding(.bottom, 8)
            
            HStack {
                Text(book.year)
                    .font(.paragraph3)
                    .foregroundColor(.gray5)
                    .padding(.trailing, 1)
                
                Text(book.publisher)
                    .font(.paragraph3)
                    .foregroundColor(.gray5)
            }
        }
        Spacer()
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
    .background(Color(.black2))
    .cornerRadius(16)
    .listRowBackground(Color.clear)
}
