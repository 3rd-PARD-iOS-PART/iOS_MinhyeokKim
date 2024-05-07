//
//  searchDetailViewController.swift
//  4th_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/14.
//

import UIKit

class SearchDetailViewController: UIViewController {
    var movieTitle: String?
    var movieSubtitle: String?
    var movieDescription: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        setUI()
        configureHeader()
    }
    
    let header = SearchDetailHeaderView()
    
    func setUI() {
        view.addSubview(header)
        
        NSLayoutConstraint.activate([
            // header
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
    func configureHeader() {
        header.titleLabel.text = movieTitle
        header.subTitleLabel.text = movieTitle
        header.descriptionLabel.text = movieDescription
    }
}
