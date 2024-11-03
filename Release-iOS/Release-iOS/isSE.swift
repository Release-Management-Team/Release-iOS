//
//  isSE.swift
//  Release-iOS
//
//  Created by 신지원 on 11/4/24.
//

import UIKit

extension UIScreen {
    static var isSE: Bool { UIScreen.main.bounds.height < 680 }
}

extension UIImage {
    func tinted(with color: UIColor) -> UIImage {
        UIGraphicsImageRenderer(size: size).image { _ in
            color.setFill()
            withRenderingMode(.alwaysTemplate).draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
