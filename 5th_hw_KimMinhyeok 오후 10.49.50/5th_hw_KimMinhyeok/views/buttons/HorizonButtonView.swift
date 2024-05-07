//
//  horizonButtonView.swift
//  4th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/14.
//

import UIKit

class HorizonButtonComponent: UIButton {
    init(frame: CGRect, title: String, image: String, titleColor: UIColor, backgroundColor: UIColor) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        setupUI(titleText: title, imageText: image, titleColor: titleColor, backgroundColor: backgroundColor)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(titleText: String, imageText: String, titleColor: UIColor, backgroundColor: UIColor) {
        // configuration: Button안 image, title 공존 및 기타 설정을 위함
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = backgroundColor
        // image 스타일 적용
        if let image = UIImage(named: imageText) {
            let size = CGSize(width: 18, height: 18)
            UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
            image.draw(in: CGRect(origin: .zero, size: size))
            let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            configuration.image = scaledImage
        }
        // title 스타일 적용
        configuration.attributedTitle = AttributedString(titleText, attributes: AttributeContainer([
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .medium),
            NSAttributedString.Key.foregroundColor: titleColor
        ])
        )
        
        // image와 title 사이 간격: 7
        configuration.imagePadding = 8
        configuration.titlePadding = 8
        configuration.imagePlacement = .leading // image가 title보다 위로 오게 및 horizontal 정렬
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // 위에서 설정한 configuration으로 버튼 생성
        
        self.configuration = configuration
    }
}
