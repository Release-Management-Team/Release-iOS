//
//  HomeWeeklyViewCell.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct HomeWeeklyViewCell: View {
    let event: WeeklyEvent
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(event.category)
                    .font(.paragraph1)
                    .foregroundColor(.gray4)
                    .padding(.bottom, 8)
                
                Text(event.title)
                    .font(.heading4)
                    .foregroundColor(.gray1)
                    .padding(.bottom, 16)
                
                Text(event.time)
                    .font(.paragraph2)
                    .foregroundColor(.gray3)
            }
            
            Spacer()
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 15)
        .background(Color.black2)
        .cornerRadius(16)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .stroke(Color.primary1, lineWidth: 1)
        )
    }
}
