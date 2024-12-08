//
//  Dummy.swift
//  Release-iOS
//
//  Created by 신지원 on 8/15/24.
//

import Foundation

let dummyActivityResult = ActivityResult(activities: [
    ActivityDTO(
        type: "Sports",
        name: "Morning Yoga",
        description: "A refreshing yoga session to start your day.",
        leader: "Alice Johnson",
        members: ["Bob", "Cathy", "David"],
        tags: ["Wellness", "Exercise"],
        state: "recruiting",
        image: "https://example.com/yoga.png",
        link: "https://example.com/morning-yoga"
    ),
    ActivityDTO(
        type: "Workshop",
        name: "Photography Basics",
        description: "Learn the fundamentals of photography in this interactive workshop.",
        leader: "John Doe",
        members: ["Ella", "Frank", "Grace"],
        tags: ["Photography", "Art"],
        state: "before_recruit",
        image: "https://example.com/photo.png",
        link: "https://example.com/photography-basics"
    ),
    ActivityDTO(
        type: "Music",
        name: "Guitar Jam Session",
        description: "Join us for a casual evening of guitar music.",
        leader: "Eve Martinez",
        members: ["Henry", "Ivy", "Jack"],
        tags: ["Music", "Casual"],
        state: "running",
        image: "https://example.com/guitar.png",
        link: "https://example.com/guitar-jam"
    ),
    ActivityDTO(
        type: "Technology",
        name: "AI for Beginners",
        description: "An introductory course on artificial intelligence.",
        leader: "Sophia Lee",
        members: ["Katie", "Liam", "Mia"],
        tags: ["AI", "Tech"],
        state: "recruiting",
        image: "https://example.com/ai.png",
        link: "https://example.com/ai-beginners"
    ),
    ActivityDTO(
        type: "Cooking",
        name: "Italian Cooking Class",
        description: "Master the art of Italian cuisine.",
        leader: "Marco Rossi",
        members: ["Nina", "Oliver", "Penny"],
        tags: ["Cooking", "Food"],
        state: "running",
        image: "https://example.com/cooking.png",
        link: "https://example.com/italian-cooking"
    ),
    ActivityDTO(
        type: "Fitness",
        name: "Evening Run Club",
        description: "Join us for a scenic evening run.",
        leader: "Chris Taylor",
        members: ["Quinn", "Ryan", "Sam"],
        tags: ["Running", "Fitness"],
        state: "before_recruit",
        image: "https://example.com/run.png",
        link: "https://example.com/evening-run"
    ),
    ActivityDTO(
        type: "Art",
        name: "Watercolor Painting",
        description: "Relax and create beautiful watercolor art.",
        leader: "Lucy Green",
        members: ["Tom", "Uma", "Victor"],
        tags: ["Art", "Creative"],
        state: "recruiting",
        image: "https://example.com/painting.png",
        link: "https://example.com/watercolor"
    ),
    ActivityDTO(
        type: "Volunteer",
        name: "Beach Cleanup",
        description: "Help us clean up the beach and protect marine life.",
        leader: "Emma Watson",
        members: ["Will", "Xander", "Yara"],
        tags: ["Environment", "Volunteer"],
        state: "running",
        image: "https://example.com/cleanup.png",
        link: "https://example.com/beach-cleanup"
    ),
    ActivityDTO(
        type: "Gaming",
        name: "Board Game Night",
        description: "A fun-filled evening with classic board games.",
        leader: "Oscar Brown",
        members: ["Zane", "Amy", "Ben"],
        tags: ["Games", "Social"],
        state: "before_recruit",
        image: "https://example.com/boardgames.png",
        link: "https://example.com/board-game-night"
    ),
    ActivityDTO(
        type: "Dance",
        name: "Salsa Dance Workshop",
        description: "Learn the basics of salsa dancing in a friendly environment.",
        leader: "Carlos Rivera",
        members: ["Cleo", "Dan", "Eva"],
        tags: ["Dance", "Fun"],
        state: "recruiting",
        image: "https://example.com/salsa.png",
        link: "https://example.com/salsa-workshop"
    )
])

let dummyEventResponse = EventResponse(evets: [
    EventDTO(
        name: "개강총회",
        description: "2024년 가을학기 개강을 맞아 개강총회를 개최합니다.",
        start_time: "2024-09-06T18:00:00+09:00",
        end_time: "2024-09-06T18:30:00+09:00",
        place: "서강대학교"
    ),
    EventDTO(
        name: "개강총회",
        description: "2024년 가을학기 개강을 맞아 개강총회를 개최합니다.",
        start_time: "2024-09-06T18:00:00+09:00",
        end_time: "2024-09-06T18:30:00+09:00",
        place: "서강대학교"
    ),
    EventDTO(
        name: "개강총회",
        description: "2024년 가을학기 개강을 맞아 개강총회를 개최합니다.",
        start_time: "2024-09-06T18:00:00+09:00",
        end_time: "2024-09-06T18:30:00+09:00",
        place: "서강대학교"
    ),
])

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

