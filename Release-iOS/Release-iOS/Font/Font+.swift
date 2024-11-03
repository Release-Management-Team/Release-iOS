//
//  UIFont+.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import UIKit

extension UIFont {
    static func heading(size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-SemiBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    static func regular(size: CGFloat) -> UIFont {
        return UIFont(name: "Pretendard-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }

    static var heading0: UIFont {
        return UIFont.heading(size: 72)
    }

    static var heading1: UIFont {
        return UIFont.heading(size: 48)
    }
    
    static var heading2: UIFont {
        return UIFont.heading(size: 32)
    }
    
    static var heading3: UIFont {
        return UIFont.heading(size: 24)
    }
    
    static var heading4: UIFont {
        return UIFont.heading(size: 18)
    }
    
    static var paragraph1: UIFont {
        return UIFont.regular(size: 16)
    }
    
    static var paragraph2: UIFont {
        return UIFont.regular(size: 14)
    }
    
    static var paragraph3: UIFont {
        return UIFont.regular(size: 12)
    }
}
