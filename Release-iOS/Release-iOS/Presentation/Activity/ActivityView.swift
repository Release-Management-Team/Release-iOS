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
        NavigationView {
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
                    ZStack {
                        NavigationLink(destination: ActivityDetailView(activity: activity)) {
                            EmptyView()
                        }
                        .opacity(0.0)
                        activityCell(for: activity)
                    }
                    .listRowBackground(Color.black1)
                }
                .listStyle(PlainListStyle())
            }
            .background(Color.black1)
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
