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
        NavigationView {
            List(activities) { activity in
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
                } -
                .padding(.horizontal, 16)
                .padding(.vertical, 12)
                .background(Color(.black2))
                .cornerRadius(16)
            }
            .listStyle(PlainListStyle())
            .background(Color.black1.edgesIgnoringSafeArea(.all))
            .navigationTitle("활동")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundColor = UIColor.black1
                appearance.titleTextAttributes = [.foregroundColor: UIColor.gray1]
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        .background(Color(.black2))
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
