//
//  ManageCell.swift
//  Release-iOS
//
//  Created by 신지원 on 3/23/25.
//

import UIKit

import SnapKit
import Then

final class ManageCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "ManageCell"
    
    //MARK: - UI Components
    
    private let cellView = UIView()
    private let titleLabel = UILabel()
    
    //MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup UI
    
    private func setUI() {
        contentView.backgroundColor = .black1
        
        cellView.do {
            $0.backgroundColor = .black2
            $0.layer.cornerRadius = 16
        }
        
        titleLabel.do {
            $0.font = .heading4
            $0.textColor = .gray1
            $0.numberOfLines = 2
        }
    }
    
    private func setHierarchy() {
        contentView.addSubview(cellView)
        cellView.addSubview(titleLabel)
    }
    
    private func setLayout() {
        cellView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(8)
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    //MARK: - Bind Data
    
    func configure(with title: String) {
        titleLabel.text = title
    }
}
