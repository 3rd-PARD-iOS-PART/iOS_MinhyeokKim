//
//  PartFilterCell.swift
//  7th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/11.
//

import UIKit

class PartFilterCell: UICollectionViewCell {
    
    let partLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .center
        label.layer.cornerRadius = 30
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.lightGray.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        // 셀에 레이블을 추가합니다
        addSubview(partLabel)
        
        // 레이블의 제약 조건을 설정합니다
        NSLayoutConstraint.activate([
            partLabel.topAnchor.constraint(equalTo: topAnchor),
            partLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            partLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            partLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
