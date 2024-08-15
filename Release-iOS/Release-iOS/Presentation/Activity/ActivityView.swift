//
//  ActivityView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct Activity: Identifiable {
    let id = UUID()
    let image: String
    let category: String
    let status: String
    let title: String
    let content: String
    let person: String
}

struct ActivityView: View {
    
    @State private var selectedCategory = StringLiterals.Activity.study
    @State private var activityData: [Activity] = activities1
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Button(action: {
                    selectedCategory = StringLiterals.Activity.study
                    activityData = activities1
                }) {
                    Text(StringLiterals.Activity.study)
                        .font(.heading4)
                        .foregroundColor(selectedCategory == StringLiterals.Activity.study ? Color.black1 : Color.gray5)
                        .padding(.vertical, 7)
                        .frame(maxWidth: .infinity)
                        .background(selectedCategory == StringLiterals.Activity.study ? Color.primary1 : Color.black2)
                        .cornerRadius(32)
                }
                
                Button(action: {
                    selectedCategory = StringLiterals.Activity.event
                    activityData = activities2
                }) {
                    Text(StringLiterals.Activity.event)
                        .font(.heading4)
                        .foregroundColor(selectedCategory == StringLiterals.Activity.event ? Color.black1 : Color.gray5)
                        .padding(.vertical, 7)
                        .frame(maxWidth: .infinity)
                        .background(selectedCategory == StringLiterals.Activity.event ? Color.primary1 : Color.black2)
                        .cornerRadius(32)
                }
            }
            .padding(8)
            .background(Color.black2)
            .cornerRadius(32)
            .padding(.horizontal, 24)
            
            List(activityData) { activity in
                activityCell(for: activity)
            }
            .listStyle(PlainListStyle())
        }
    }
}

private func activityCell(for activity: Activity) -> some View {
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
        Spacer()
    }
    .padding(.horizontal, 16)
    .padding(.vertical, 12)
    .background(Color(.black2))
    .cornerRadius(16)
    .listRowBackground(Color.clear)
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
