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
    
    @State private var selectedCategory = "스터디/세미나"
    
    let activities = [
        Activity(image: "icRing", category: "세미나", status: "모집 중", title: "쿠로미 원정대", content: "Kolin, Food, Tteokbokki", person: "신지원"),
        Activity(image: "icRing", category: "세미나", status: "모집 중", title: "쿠로미 원정대", content: "Kolin, Food, Tteokbokki", person: "신지원"),
        Activity(image: "icRing", category: "세미나", status: "모집 중", title: "쿠로미 원정대", content: "Kolin, Food, Tteokbokki", person: "신지원"),
        Activity(image: "icRing", category: "세미나", status: "모집 중", title: "쿠로미 원정대", content: "Kolin, Food, Tteokbokki", person: "신지원"),
        Activity(image: "icRing", category: "세미나", status: "모집 중", title: "쿠로미 원정대", content: "Kolin, Food, Tteokbokki", person: "신지원"),
        Activity(image: "icRing", category: "세미나", status: "모집 중", title: "쿠로미 원정대", content: "Kolin, Food, Tteokbokki", person: "신지원"),
        Activity(image: "icRing", category: "세미나", status: "모집 중", title: "쿠로미 원정대", content: "Kolin, Food, Tteokbokki", person: "신지원"),
        Activity(image: "icRing", category: "세미나", status: "모집 중", title: "쿠로미 원정대", content: "Kolin, Food, Tteokbokki", person: "신지원")
    ]
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    selectedCategory = "스터디/세미나"
                }) {
                    Text("스터디/세미나")
                        .font(.heading4)
                        .foregroundColor(selectedCategory == "스터디/세미나" ? Color.black1 : Color.gray5)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 7)
                        .background(selectedCategory == "스터디/세미나" ? Color.primary1 : Color.black2)
                        .cornerRadius(32)
                }
                
                Button(action: {
                    selectedCategory = "프로젝트"
                }) {
                    Text("프로젝트")
                        .font(.heading4)
                        .foregroundColor(selectedCategory == "프로젝트" ? Color.black1 : Color.gray5)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 7)
                        .background(selectedCategory == "프로젝트" ? Color.primary1 : Color.black2)
                        .cornerRadius(32)
                }
            }
            .padding(.top, 8)
            .padding(.horizontal, 24)
            
            List(activities) { activity in
                buildActivityCell(for: activity)
            }
            .listStyle(PlainListStyle())
            .background(Color.black1.edgesIgnoringSafeArea(.all))
        }
    }
}

private func buildActivityCell(for activity: Activity) -> some View {
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
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
