//
//  SearchDetailHeaderView.swift
//  4th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/14.
//

import UIKit

class SearchDetailHeaderView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundColor = .clear
        
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "plus")
        return imageView
    }()
    
    let fullScreenButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "fullScreen"), for: .normal)
//        button.addTarget(self, action: #selector(fullScreenButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let popButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pop"), for: .normal)
//        button.addTarget(self, action: #selector(popButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "netflixSeriesLogo")
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    let infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "metadata")
        return imageView
    }()
    
    let playButton = HorizonButtonComponent(frame: .zero, title: "Play", image: "play", titleColor: .black, backgroundColor: .white)
    
    let downloadButton = HorizonButtonComponent(frame: .zero, title: "Download", image: "searchDownload", titleColor: UIColor(red: 115/255, green: 115/255, blue: 115/255, alpha: 1.0), backgroundColor: UIColor(red: 41/255, green: 41/255, blue: 41/255, alpha: 1.0))
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        
        return label
    }()
    
    let buttonStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal // 가로 정렬
        stackView.spacing = 56 // content간 간격: 56
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let myListButton = VerticalButtonComponent(frame: .zero, title: "My list", image: "plus", titleColor: UIColor(red: 115/255, green: 115/255, blue: 115/255, alpha: 1.0), backgroundColor: .clear)
        
        let rateButton = VerticalButtonComponent(frame: .zero, title: "Rate", image: "rate", titleColor: UIColor(red: 115/255, green: 115/255, blue: 115/255, alpha: 1.0), backgroundColor: .clear)
        
        let shareButton = VerticalButtonComponent(frame: .zero, title: "Share", image: "send", titleColor: UIColor(red: 115/255, green: 115/255, blue: 115/255, alpha: 1.0), backgroundColor: .clear)
        
        stackView.addArrangedSubview(myListButton)
        stackView.addArrangedSubview(rateButton)
        stackView.addArrangedSubview(shareButton)
        
        return stackView
    }()
    
    func setupUI() {
        self.addSubview(imageView)
        self.addSubview(fullScreenButton)
        self.addSubview(popButton)
        self.addSubview(logoImageView)
        self.addSubview(titleLabel)
        self.addSubview(infoImageView)
        self.addSubview(playButton)
        self.addSubview(downloadButton)
        self.addSubview(subTitleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(buttonStack)
        
        NSLayoutConstraint.activate([
            // imageView
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 210),
            
            // popButton
            popButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            popButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            popButton.widthAnchor.constraint(equalToConstant: 28),
            popButton.heightAnchor.constraint(equalToConstant: 28),
            
            // fullScreenButton
            fullScreenButton.topAnchor.constraint(equalTo: popButton.topAnchor),
            fullScreenButton.trailingAnchor.constraint(equalTo: popButton.leadingAnchor, constant: -16),
            fullScreenButton.widthAnchor.constraint(equalToConstant: 28),
            fullScreenButton.heightAnchor.constraint(equalToConstant: 28),
            
            // logoImageView
            logoImageView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 11),
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
//            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 300),
            logoImageView.heightAnchor.constraint(equalToConstant: 15),
            
            // titleLabel
            titleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            // infoImageView
            infoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 9),
            infoImageView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
//            infoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 137),
            infoImageView.heightAnchor.constraint(equalToConstant: 14),
            
            // playButton
            playButton.topAnchor.constraint(equalTo: infoImageView.bottomAnchor, constant: 11),
            playButton.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            playButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            playButton.heightAnchor.constraint(equalToConstant: 34),
            
            // downloadButton
            downloadButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 8),
            downloadButton.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            downloadButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            downloadButton.heightAnchor.constraint(equalToConstant: 34),
            
            // subtitleLabel
            subTitleLabel.topAnchor.constraint(equalTo: downloadButton.bottomAnchor, constant: 14),
            subTitleLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            subTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            // descriptionLabel
            descriptionLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 4),
            descriptionLabel.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            // buttonStack
            buttonStack.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 32),
            buttonStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 31),
//             buttonStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 112),
            buttonStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 36),
        ])
    }
}
