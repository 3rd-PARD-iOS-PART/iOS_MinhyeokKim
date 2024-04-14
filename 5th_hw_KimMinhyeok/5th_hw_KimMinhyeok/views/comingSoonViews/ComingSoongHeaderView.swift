//
//  comingSoongHeaderView.swift
//  4th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/07.
//

import UIKit

// 기본적인 UI이므로 주석 안해도 되겠지...?
class ComingSoonHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let notiIcon: UIImageView = {
        let notiIcon = UIImageView()
        notiIcon.image = UIImage(named: "notiIcon")
        notiIcon.contentMode = .scaleAspectFit
        notiIcon.clipsToBounds = true
        notiIcon.translatesAutoresizingMaskIntoConstraints = false
        
        return notiIcon
    }()

    let notiTitle: UILabel = {
        let notiTitle = UILabel()
        notiTitle.textColor = UIColor.white
        notiTitle.font = UIFont.systemFont(ofSize: 16.91, weight: .bold)
        notiTitle.translatesAutoresizingMaskIntoConstraints = false
        notiTitle.text = "Notifications"
        
        
        return notiTitle
    }()
    
    private func setupUI() {
        self.addSubview(notiIcon)
        self.addSubview(notiTitle)
        
        NSLayoutConstraint.activate([
            // self
            self.heightAnchor.constraint(equalToConstant: 45),
            
            // notiIcon
            notiIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            notiIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            notiIcon.widthAnchor.constraint(equalToConstant: 19),
            notiIcon.heightAnchor.constraint(equalToConstant: 19),
            
            // notiTitle
            notiTitle.leadingAnchor.constraint(equalTo: notiIcon.trailingAnchor, constant: 7),
            notiTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            notiTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
