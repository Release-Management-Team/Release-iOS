//
//  SplashView.swift
//  Release-iOS
//
//  Created by 신지원 on 8/28/24.
//

import SwiftUI

import Lottie

struct SplashView: UIViewRepresentable {
    
    var onAnimationCompleted: (() -> Void)?
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let animationView = LottieAnimationView(name: "splash")
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.play { (finished) in
            if finished {
                onAnimationCompleted?()
            }
        }
        
        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)
        
        NSLayoutConstraint.activate([
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animationView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
}
