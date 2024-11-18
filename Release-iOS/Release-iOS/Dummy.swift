//
//  Dummy.swift
//  Release-iOS
//
//  Created by 신지원 on 8/15/24.
//

import Foundation

let activitiesData: [ActivityDTO] = [
    ActivityDTO(
        image: "dummyLogo",
        category: "스터디",
        status: "모집 마감",
        title: "Git 스터디",
        content: "VCS",
        person: "이주헌",
        description: "Git 레포지토리를 생성하고 커밋을 통해 코드 버전을 관리할 수 있다."
    ),
    ActivityDTO(
        image: "dummyLogo",
        category: "스터디",
        status: "모집 마감",
        title: "나도 이제 데이터사이언티스트",
        content: "데이터 분석, 머신러닝",
        person: "최수빈",
        description: "데이터 분석 / 과학에 필요한 프로그래밍 역량을 인프런 데이터 사이언스 강의 로드맵에 따라 체계적으로 학습하여 데이터 분석가로서 역량을 갖춘다."
    ),
    ActivityDTO(
        image: "dummyLogo",
        category: "스터디",
        status: "모집 마감",
        title: "오픈소스",
        content: "오픈소스",
        person: "정재헌",
        description: "자신이 관심있는 오픈 소스 프로젝트에 기여하기"
    ),
    ActivityDTO(
        image: "dummyLogo",
        category: "스터디",
        status: "모집 마감",
        title: "릴리즈 해킹 및 보안 스터디",
        content: "시스템, 보안",
        person: "이민석",
        description: "팀원들과 해킹 및 보안 이론을 학습하며, CTF에 출전하여 입상을 목표로 한다."
    ),
    ActivityDTO(
        image: "dummyLogo",
        category: "스터디",
        status: "모집 마감",
        title: "알고있니 알고리즘",
        content: "알고리즘",
        person: "이아륜",
        description: "알고리즘 실력 향상"
    ),
    ActivityDTO(
        image: "dummyLogo",
        category: "스터디",
        status: "모집 마감",
        title: "하스켈",
        content: "HASKELL, 프로그래밍언어",
        person: "신현수",
        description: "가나다라마바사"
    )
]


let eventsData: [EventDTO] = [
    EventDTO(
        title: "개강 총회",
        start: "24.00.00 18:00",
        end: "24.00.00 21:00",
        place: "AS관 1016호",
        content: "개강총회는 학기 시작을 맞아 학과 전체가 모여 일정과 계획을 공유하는 모임입니다."
    ),
    EventDTO(
        title: "중간고사 대비 스터디",
        start: "24.04.10 10:00",
        end: "24.04.10 13:00",
        place: "도서관 5층 스터디룸",
        content: "중간고사를 대비하여 학과 학생들이 모여 주요 과목 스터디를 진행합니다."
    ),
    EventDTO(
        title: "학과 체육대회",
        start: "24.05.20 09:00",
        end: "24.05.20 18:00",
        place: "체육관 A구역",
        content: "학과 체육대회에서는 다양한 종목의 경기와 즐거운 이벤트가 준비되어 있습니다."
    ),
    EventDTO(
        title: "프로그래밍 해커톤",
        start: "24.06.15 10:00",
        end: "24.06.16 10:00",
        place: "컴퓨터공학과 PC실습실",
        content: "프로그래밍 해커톤은 24시간 동안 팀 프로젝트를 진행하며 실력을 겨루는 대회입니다."
    ),
    EventDTO(
        title: "종강파티",
        start: "24.06.30 19:00",
        end: "24.06.30 22:00",
        place: "학생회관 대강당",
        content: "종강을 기념하여 학과 학생들이 모여 즐겁게 한 학기를 마무리하는 행사입니다."
    )
]

let weekly1 = [
    [
        WeeklyEvent(category: "Release Management Project", title: "정기 회의", time: "15:00 ~"),
        WeeklyEvent(category: "Release Management Project", title: "정기 회의", time: "15:00 ~"),
        WeeklyEvent(category: "Release Management Project", title: "정기 회의", time: "15:00 ~"),
        WeeklyEvent(category: "Release Management Project", title: "정기 회의", time: "15:00 ~"),
        WeeklyEvent(category: "Release Management Project", title: "정기 회의", time: "15:00 ~"),
        WeeklyEvent(category: "Release Management Project", title: "정기 회의", time: "15:00 ~")
    ],
    [
        WeeklyEvent(category: "Release Management Project Release Management Project Release Management Project", title: "정기 회의", time: "15:00 ~"),
        WeeklyEvent(category: "Release Management Project", title: "정기 회의", time: "15:00 ~")
    ],
    [
        WeeklyEvent(category: "개발", title: "백엔드 개발", time: "09:00 ~ 11:00"),
        WeeklyEvent(category: "테스트", title: "유닛 테스트 작성", time: "13:00 ~ 15:00")
    ],
    [
        WeeklyEvent(category: "회의", title: "클라이언트 미팅", time: "10:00 ~ 11:00"),
        WeeklyEvent(category: "개발", title: "프론트엔드 개발", time: "11:30 ~ 13:00")
    ],
    [
        WeeklyEvent(category: "리뷰", title: "스프린트 리뷰", time: "09:30 ~ 11:00"),
        WeeklyEvent(category: "회의", title: "회고 미팅", time: "15:00 ~ 16:00")
    ],
    [],
    []
]

let weekEmpty = [
    WeeklyEvent(category: "리뷰", title: "스프린트 리뷰", time: "09:30 ~ 11:00")
]

let my1 = My(name: "신지원", staff: true, status: "나는 쿠로미 짱짱짱짱 대뻥", studentNumber: 20211547, major: "컴퓨터공학과", period: "2016.03 ~ NOW", email: "00000@sogang.ac.kr", phone: "010-0000-0000")

let notice1 = [
    Notice(title: "지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원", content: "⛔️ 16:00 ~ 18:00  랩실 출입 통제됩니다", date: "24.00.00"),
    Notice(title: "지원지원지원", content: "⛔️ 16:00 ~ 18:00  랩실 출입 통제됩니다지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원지원", date: "24.00.00"),
    Notice(title: "지원지원지원", content: "⛔️ 16:00 ~ 18:00  랩실 출입 통제됩니다", date: "24.00.00"),
    Notice(title: "지원지원지원", content: "⛔️ 16:00 ~ 18:00  랩실 출입 통제됩니다", date: "24.00.00"),
    Notice(title: "지원지원지원", content: "⛔️ 16:00 ~ 18:00  랩실 출입 통제됩니다", date: "24.00.00")
]
