//
//  BookQRReaderView.swift
//  Release-iOS
//
//  Created by 신지원 on 3/20/25.
//

import AVFoundation
import UIKit

import SnapKit
import Then

final class BookQRReaderView: UIView {
    
    //MARK: - UI Components
    
    var previewLayer = AVCaptureVideoPreviewLayer()
    private var centerGuideLineView = UIView()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        setUI()
//        setHierarchy()
//        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    
}
