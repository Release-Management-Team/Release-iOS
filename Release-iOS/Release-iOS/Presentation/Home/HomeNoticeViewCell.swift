//
//  HomeNoticeCell.swift
//  Release-iOS
//
//  Created by 신지원 on 8/24/24.
//

import SwiftUI

struct HomeNoticeViewCell: View {
    
    let notice: Notice
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(notice.content)
                    .font(.heading4)
                    .foregroundColor(.gray1)
                    .padding(.bottom, 8)
                
                Text(notice.content)
                    .font(.paragraph2)
                    .foregroundColor(.gray1)
                    .padding(.bottom, 16)
                
                HStack {
                    Spacer()
                    
                    Text(notice.date)
                        .font(.paragraph2)
                        .foregroundColor(.gray5)
                }
            }
            
            Spacer()
        }
        .padding(.vertical, 12)
        .padding(.horizontal, 16)
        .background(Color.black2)
        .cornerRadius(16)
    }
}

