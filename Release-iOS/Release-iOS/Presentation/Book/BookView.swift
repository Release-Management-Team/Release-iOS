//
//  BookView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct Book: Identifiable {
    let id = UUID()
    let image: String
    let status: String
    let title: String
    let author: String
    let year: String
    let publisher: String
}

struct BookView: View {
    var body: some View {
        Text("This is the BookView")
            .font(.title)
            .padding()
    }
}
