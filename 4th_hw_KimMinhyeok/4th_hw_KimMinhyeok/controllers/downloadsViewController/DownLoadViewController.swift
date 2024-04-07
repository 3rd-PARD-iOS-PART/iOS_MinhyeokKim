//
//  ViewController.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/28.
//

import UIKit

class DownLoadViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        setUI()
    }
    
    let didntDownloadedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "downloaddePageIcon")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let didntDownloadidLabel: UILabel = {
        let label = UILabel()
        label.text = "Movies and TV shows that you \ndownload appear heare"
        // 라벨은 두줄이 되어야함 cuz of \n
        label.numberOfLines = 2
        label.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.65)
        label.font = UIFont.systemFont(ofSize: 19, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // find 버튼
    let btnFind: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.background.backgroundColor = UIColor.white
        configuration.attributedTitle = AttributedString("Find something to Download", attributes: AttributeContainer([
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15.0, weight: .semibold),
                NSAttributedString.Key.foregroundColor: UIColor.black
            ])
        )
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let btnPlay = UIButton(configuration: configuration)
       
        btnPlay.translatesAutoresizingMaskIntoConstraints = false
        return btnPlay
    }()
    
    func setUI() {
        view.addSubview(didntDownloadedIcon)
        view.addSubview(didntDownloadidLabel)
        view.addSubview(btnFind)
        
        NSLayoutConstraint.activate([
            // didntDownloadedIcon
            didntDownloadedIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 160.0),
            didntDownloadedIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            didntDownloadedIcon.widthAnchor.constraint(equalToConstant: 194),
            didntDownloadedIcon.heightAnchor.constraint(equalToConstant: 194),
            
            // didntDownloadedLabel
            didntDownloadidLabel.topAnchor.constraint(equalTo: didntDownloadedIcon.bottomAnchor, constant: 32),
            didntDownloadidLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // btnFind
            btnFind.topAnchor.constraint(equalTo: didntDownloadidLabel.bottomAnchor, constant: 184),
            btnFind.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btnFind.widthAnchor.constraint(equalToConstant: 280),
            btnFind.heightAnchor.constraint(equalToConstant: 42),
            
        ])
    }
}
