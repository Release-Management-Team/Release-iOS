//
//  HomeWeeklyEmptyViewCell.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct HomeWeeklyEmptyViewCell: View {
    let event: WeeklyEvent
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.category)
                    .font(.paragraph1)
                    .foregroundColor(.clear)
                    .lineLimit(1)
                    .padding(.bottom, 8)
                
                Text(event.title)
                    .font(.heading4)
                    .foregroundColor(.clear)
                    .lineLimit(1)
                    .padding(.bottom, 16)
                
                Text(event.time)
                    .font(.paragraph2)
                    .foregroundColor(.clear)
                    .lineLimit(1)
            }
            
            Spacer()
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 15)
        .background(Color.clear)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.clear, lineWidth: 1)
        )
    }
}
