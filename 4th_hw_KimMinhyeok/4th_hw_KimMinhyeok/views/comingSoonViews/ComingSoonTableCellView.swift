//
//  ComingSoonMovieCell.swift
//  4th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/07.
//

import UIKit

class ComingSoonTableCellView: UITableViewCell {
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "Cell")
        contentView.backgroundColor = UIColor.black
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let btnRemindMe: UIButton = {
        // configuration: Button안 image, title 공존 및 기타 설정을 위함
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear
        if let image = UIImage(named: "remindMe") {
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            configuration.image = scaledImage
        }
        configuration.attributedTitle = AttributedString("Remind Me", attributes: AttributeContainer([
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11.13, weight: .regular)
            ])
        )
        configuration.imagePadding = 7
        configuration.titlePadding = 7
        configuration.imagePlacement = .top // image가 title보다 위로 오게 및 verticle 정렬
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let btnRemindMe = UIButton(configuration: configuration)
       
        btnRemindMe.translatesAutoresizingMaskIntoConstraints = false
        return btnRemindMe
    }()
    
    let btnShare: UIButton = {
        // configuration: Button안 image, title 공존 및 기타 설정을 위함
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = .clear
        if let image = UIImage(named: "share") {
            let size = CGSize(width: 24, height: 24)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            configuration.image = scaledImage
        }
        configuration.attributedTitle = AttributedString("Share", attributes: AttributeContainer([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 11.13, weight: .regular)]))
        configuration.imagePadding = 7
        configuration.titlePadding = 7
        configuration.imagePlacement = .top // image가 title보다 위로 오게 및 verticle 정렬
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let btnShare = UIButton(configuration: configuration)
       
        btnShare.translatesAutoresizingMaskIntoConstraints = false
        return btnShare
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11.4, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 18.66, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11.14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let keywordLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 11.4, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setupUI() {
        contentView.addSubview(cellImageView)
        contentView.addSubview(btnRemindMe)
        contentView.addSubview(btnShare)
        contentView.addSubview(dateLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(keywordLabel)
        
        NSLayoutConstraint.activate([
            // cellImageView
            cellImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellImageView.heightAnchor.constraint(equalToConstant: 195),
            
            // btnRemindMe
            btnRemindMe.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 20),
            btnRemindMe.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 227),
            btnRemindMe.bottomAnchor.constraint(equalTo: btnShare.bottomAnchor),
            
            // btnShare
            btnShare.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 20),
            btnShare.leadingAnchor.constraint(equalTo: btnRemindMe.trailingAnchor, constant: 45),
            btnShare.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            // dateLabel
            dateLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 73),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            dateLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            // titleLabel
            titleLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 13.13),
            titleLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            
            // descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12.87),
            descriptionLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            
            // keywordLabel
            keywordLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            keywordLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            keywordLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            keywordLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -17)
        ])
    }
}
