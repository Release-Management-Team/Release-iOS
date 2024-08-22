//
//  ActivityCell.swift
//  Release-iOS
//
//  Created by 신지원 on 8/16/24.
//

import SwiftUI

func activityCell(for activity: ActivityDTO) -> some View {
    HStack {
        Image(activity.image)
            .resizable()
            .frame(width: 96, height: 96)
            .padding(.trailing, 16)
        
        VStack(alignment: .leading) {
            HStack {
                Text(activity.category)
                    .font(.paragraph3)
                    .foregroundColor(.gray5)
                
                Spacer()
                
                Text(activity.status)
                    .font(.paragraph3)
                    .foregroundColor(Color.black2)
                    .padding(.horizontal, 17)
                    .padding(.vertical, 3.5)
                    .background(Color.primary1)
                    .cornerRadius(8)
            }
            .padding(.bottom, 5)
            
            Text(activity.title)
                .font(.heading4)
                .foregroundColor(.gray1)
            
            Text(activity.content)
                .font(.paragraph3)
                .foregroundColor(.gray3)
                .padding(.bottom, 8)
            
            Text(activity.person)
                .font(.paragraph2)
                .foregroundColor(.gray3)
        }
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
    .background(Color(.black2))
    .cornerRadius(16)
    .listRowBackground(Color.clear)
}

func eventCell(for event: EventDTO) -> some View {
    HStack {
        VStack(alignment: .leading) {
            Text(event.category)
                .font(.paragraph3)
                .foregroundColor(.gray5)
                .padding(.bottom, 8)
            
            Text(event.title)
                .font(.heading4)
                .foregroundColor(.gray1)
                .padding(.bottom, 8)
            
            Text(event.content)
                .font(.paragraph3)
                .foregroundColor(.gray3)
                .padding(.bottom, 8)
            
            HStack {
                Text(event.start)
                    .font(.paragraph2)
                    .foregroundColor(.gray3)
                    .padding(.trailing, 1)
                
                Text(event.end)
                    .font(.paragraph2)
                    .foregroundColor(.gray3)
                    .padding(.trailing, 24)
                
                Text(event.place)
                    .font(.paragraph2)
                    .foregroundColor(.gray3)
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

