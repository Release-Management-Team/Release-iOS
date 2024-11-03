//
//  SplashView.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

import Lottie
import SnapKit
import Then

class SplashViewController: UIViewController {
    
    var onAnimationCompleted: (() -> Void)?
    
    private let animationView = LottieAnimationView(name: "splash").then {
        $0.contentMode = .scaleAspectFit
        $0.loopMode = .playOnce
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        playAnimation()
    }
    
    private func setupUI() {
        view.addSubview(animationView)
        
        animationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func playAnimation() {
        animationView.play { [weak self] finished in
            if finished {
                self?.onAnimationCompleted?()
            }
        }
    }
}
