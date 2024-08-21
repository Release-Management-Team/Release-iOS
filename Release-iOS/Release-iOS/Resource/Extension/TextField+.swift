//
//  TextField+.swift
//  Release-iOS
//
//  Created by 신지원 on 8/22/24.
//

import SwiftUI

struct CustomTextField: View {
    @Binding var text: String
    var placeholder: String

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(.gray4)
            }
            TextField("", text: $text)
                .foregroundColor(.gray4)
        }
        .padding(.horizontal, 24)
        .padding(.vertical, 21)
        .background(Color.black2)
        .cornerRadius(16)
    }
}
