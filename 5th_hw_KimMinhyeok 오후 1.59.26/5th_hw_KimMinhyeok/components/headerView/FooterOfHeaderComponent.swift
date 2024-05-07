//
//  FooterOfHeader.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/04.
//

import UIKit

class FooterOfHeaderComponent: UIView {
    
    weak var viewController: UIViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        let _: UIStackView = {
            let footerOfHeader = UIStackView()
            footerOfHeader.axis = .horizontal // 가로 정렬
            footerOfHeader.spacing = 42 // contents간 간격: 42
            footerOfHeader.alignment = .center // 수직 정렬
            footerOfHeader.translatesAutoresizingMaskIntoConstraints = false
            
            let btnMyList: UIButton = {
                // configuration: Button안 image, title 공존 및 기타 설정을 위함
                var configuration = UIButton.Configuration.filled()
                configuration.background.backgroundColor = .clear
                configuration.title = "MyList"
                configuration.image = UIImage(named: "plus")
                configuration.imagePadding = 1
                configuration.titlePadding = 1
                configuration.imagePlacement = .top // image가 title보다 위로 오게 및 verticle 정렬
                configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let btnMyList = UIButton(configuration: configuration)
                btnMyList.setTitleColor(.white, for: .normal)
                btnMyList.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .regular)
               
                btnMyList.translatesAutoresizingMaskIntoConstraints = false
                return btnMyList
            }()
            
            let btnPlay: UIButton = {
                var configuration = UIButton.Configuration.filled()
                configuration.background.backgroundColor = UIColor.lightGray
                configuration.title = "Play"
                configuration.image = UIImage(named: "play")
                configuration.imagePadding = 15
                configuration.titlePadding = 15
                configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let btnPlay = UIButton(configuration: configuration)
                btnPlay.setTitleColor(.white, for: .normal)
                btnPlay.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .regular)
               
                btnPlay.translatesAutoresizingMaskIntoConstraints = false
                return btnPlay
            }()
            
            let btnInfo: UIButton = {
                var configuration = UIButton.Configuration.filled()
                configuration.background.backgroundColor = .clear
                configuration.title = "Info"
                configuration.image = UIImage(named: "info")
                configuration.imagePadding = 1
                configuration.titlePadding = 1
                configuration.imagePlacement = .top
                configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let btnInfo = UIButton(configuration: configuration)
                btnInfo.setTitleColor(.white, for: .normal)
                btnInfo.titleLabel?.font = UIFont.systemFont(ofSize: 13.64, weight: .regular)
               
                btnInfo.translatesAutoresizingMaskIntoConstraints = false
                return btnInfo
            }()
            
            // stackView에 각 버튼 등록
            footerOfHeader.addArrangedSubview(btnMyList)
            footerOfHeader.addArrangedSubview(btnPlay)
            footerOfHeader.addArrangedSubview(btnInfo)
            
            NSLayoutConstraint.activate([
                btnMyList.widthAnchor.constraint(equalToConstant: 60),
                btnMyList.heightAnchor.constraint(equalToConstant: 50),
                
                btnPlay.widthAnchor.constraint(equalToConstant: 110.62),
                btnPlay.heightAnchor.constraint(equalToConstant: 45),
                
                btnInfo.widthAnchor.constraint(equalToConstant: 60),
                btnInfo.heightAnchor.constraint(equalToConstant: 50),
            ])
            
            return footerOfHeader
        }()
    }
}
