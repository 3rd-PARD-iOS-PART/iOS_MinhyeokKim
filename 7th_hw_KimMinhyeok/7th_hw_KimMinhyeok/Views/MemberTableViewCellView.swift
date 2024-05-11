//
//  MemberTableViewCellView.swift
//  7th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/05/11.
//

import UIKit

class MemberTableViewCellView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        setupUI()    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var partLabel: UILabel! = {
        var label = UILabel()
        label.textColor = UIColor.black
        label.text = "하이"
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    var nameLabel: UILabel! = {
        var label = UILabel()
        label.text = "하이"
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private func setupUI() {
        self.backgroundColor = UIColor.white
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(partLabel)
        
        NSLayoutConstraint.activate([
            partLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            partLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: partLabel.trailingAnchor, constant: 18),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(with member: MemberModel) {
        print("configure 실행")
        partLabel.text = "[\(member.part)]"
        nameLabel.text = member.name
    }
}
