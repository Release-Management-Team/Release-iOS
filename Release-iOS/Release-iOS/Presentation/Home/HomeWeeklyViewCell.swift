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
        .padding(.vertical, 24)
        .padding(.horizontal, 15)
        .background(Color.black2)
        .border(.primary2, width: 1)
        .cornerRadius(16)
    }
}
