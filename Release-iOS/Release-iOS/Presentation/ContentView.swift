//
//  ContentView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isAnimationCompleted = false
    
    var body: some View {
        ZStack {
            if isAnimationCompleted {
                LoginView()
                    .transition(.opacity)
            } else {
                SplashView(onAnimationCompleted: {
                    withAnimation {
                        isAnimationCompleted = true
                    }
                })
                .background(Color.black1)
                .transition(.opacity)
            }
        }
    }
}
