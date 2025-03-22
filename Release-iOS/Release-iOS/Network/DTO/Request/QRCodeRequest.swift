//
//  QRCodeRequest.swift
//  Release-iOS
//
//  Created by 신지원 on 2/28/25.
//

struct QRCodeRequest: Encodable {
    let qrcode: String
    
    enum CodingKeys: String, CodingKey {
        case qrcode = "qrcode"
    }
}
