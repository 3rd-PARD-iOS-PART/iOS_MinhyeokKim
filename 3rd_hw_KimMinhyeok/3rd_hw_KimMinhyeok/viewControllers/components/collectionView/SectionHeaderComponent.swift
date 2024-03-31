//
//  SectionHeaderComponent.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/31.
//

import UIKit

// sectionHeader: UIView로 하여 cell이 움직이더라도 화면에서 함께 움직이지 않게 하기 위함
class SectionHeaderComponent: UIView {
    let category: UILabel = {
        let category = UILabel()
        category.translatesAutoresizingMaskIntoConstraints = false
        category.textAlignment = .left
        category.font = .systemFont(ofSize: 20.92, weight: .bold)
        category.textColor = UIColor.white
        
        return category
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        self.backgroundColor = UIColor.black
    
        self.addSubview(category)
        
        NSLayoutConstraint.activate([
            category.topAnchor.constraint(equalTo: self.topAnchor, constant: 22),
            category.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
        ])
    }
}
