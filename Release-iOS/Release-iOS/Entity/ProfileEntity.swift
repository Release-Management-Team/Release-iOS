//
//  ProfileEntity.swift
//  Release-iOS
//
//  Created by 신지원 on 2/27/25.
//

struct ProfileEntity {
    let image: String
    let contentEntity: ProfileContentEntity
    let informationEntity: ProfileInfomationEntity
}

struct ProfileContentEntity {
    let name: String
    let message: String?
    let isExecutive: Bool
    let infomation: ProfileInfomationEntity
}

struct ProfileInfomationEntity {
    let id: String
    let department: String
    let phone: String
    let email: String
    let state: String
    let joined_semester: String
}
