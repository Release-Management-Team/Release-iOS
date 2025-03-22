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
    private let scanAreaView = UIView()
    private let dimmedLayer = CAShapeLayer()
    let backButton = UIButton()
    
    //MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        previewLayer.frame = self.bounds

        if previewLayer.superlayer == nil {
            layer.insertSublayer(previewLayer, at: 0)
        }
    }
    
    //MARK: - Setup UI
    
    private func setUI() {
        scanAreaView.do {
            $0.layer.borderColor = UIColor.black1.cgColor
            $0.layer.borderWidth = 1
            $0.isUserInteractionEnabled = false
        }
        
        dimmedLayer.do {
            $0.fillColor = UIColor.black1.withAlphaComponent(0.6).cgColor
            $0.fillRule = .evenOdd
        }
        
        backButton.do {
            $0.setImage(.icArrow, for: .normal)
            $0.layer.cornerRadius = 16
            $0.backgroundColor = .gray2.withAlphaComponent(0.7)
        }
    }
    
    private func setHierarchy() {
        layer.addSublayer(previewLayer)
        [backButton,
         scanAreaView].forEach {
            addSubview($0)
        }
        layer.addSublayer(dimmedLayer)
    }
    
    private func setLayout() {
        scanAreaView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(250)
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(13)
            $0.leading.equalToSuperview().inset(24)
            $0.size.equalTo(48)
        }
    }
    
    //MARK: - Update UI
    
    var scanRectInPreviewLayer: CGRect {
        return previewLayer.metadataOutputRectConverted(fromLayerRect: scanAreaView.frame)
    }
}
