//
//  ActivityEntity.swift
//  Release-iOS
//
//  Created by 신지원 on 3/22/25.
//

import Foundation

enum ActivityInfo: String {
    case study
    case project
    case unknown
}

enum ActivityState: String {
    case recruiting
    case beforeRecruit
    case running
}

struct ActivityEntity {
    let id: Int
    let title: String
    let leader: String
    let image: String
    let info: ActivityInfo
    let state: ActivityState
}

struct ActivityDetailEntity {
    let id: Int
    let title: String
    let content: String
    let leader: String
    let image: String
    let link: String
    let info: ActivityInfo
    let state: ActivityState
}

struct EventEntity {
    let id: Int
    let title: String
    let start_time: String
    let place: String
}
