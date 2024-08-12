//
//  Font+.swift
//  Release-iOS
//
//  Created by 신지원 on 8/13/24.
//

import SwiftUI

extension Font {
    static func heading(size: CGFloat) -> Font {
        return Font.custom("Pretendard-SemiBold", size: size)
    }
    
    static func regular(size: CGFloat) -> Font {
        return Font.custom("Pretendard-Regular", size: size)
    }

    static var heading0: Font {
        return Font.heading(size: 72)
    }

    static var heading1: Font {
        return Font.heading(size: 48)
    }
    
    static var heading2: Font {
        return Font.heading(size: 32)
    }
    
    static var heading3: Font {
        return Font.heading(size: 24)
    }
    
    static var heading4: Font {
        return Font.heading(size: 18)
    }
    
    static var paragraph1: Font {
        return Font.regular(size: 16)
    }
    
    static var paragraph2: Font {
        return Font.regular(size: 14)
    }
    
    static var paragraph3: Font {
        return Font.regular(size: 12)
    }
}
