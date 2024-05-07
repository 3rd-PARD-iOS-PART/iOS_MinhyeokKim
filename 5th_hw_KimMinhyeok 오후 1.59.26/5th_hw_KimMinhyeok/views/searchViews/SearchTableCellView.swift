//
//  SearchTableView.swift
//  4th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/06.
//

import UIKit

// 기본적인 UI 라 주석 더이상 x, 여러 재료들 선언 후 addSubview, constraint 설정이 다 임
class SearchTableCellView: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        contentView.backgroundColor = UIColor.black
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellView: UIView = {
        let cellView = UIView()
        cellView.backgroundColor = UIColor.gray
        cellView.translatesAutoresizingMaskIntoConstraints = false
        return cellView
    }()
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 14.72, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "searchPlay"), for: .normal) // 이미지 설정
        button.backgroundColor = .clear // 배경색 설정
        return button
    }()
    
    private func setupUI() {
        contentView.addSubview(cellView)
        cellView.addSubview(cellImageView)
        cellView.addSubview(label)
        cellView.addSubview(button)
        
        NSLayoutConstraint.activate([
            // cellView
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3),
            
            // imageView
            cellImageView.topAnchor.constraint(equalTo: cellView.topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            cellImageView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -229),
            
            // label
            label.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor, constant: 7),
            label.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            
            // button
            button.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 7),
            button.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -3),
            button.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.heightAnchor.constraint(equalToConstant: 25),
        ])
    }
}
