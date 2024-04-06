//
//  File.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/04.
//

import UIKit

class MyListViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setUI()
    }
    
    // scrollView
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never // safeArea 영역 무시 -> 상태바까지 scrollView가 채워질 수 있도록
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let header = HeaderComponent()
    
    func setUI(){
        view.addSubview(header)
        view.addSubview(scrollView)
        
        header.viewController = self
        
        NSLayoutConstraint.activate([
            // header
            header.topAnchor.constraint(equalTo: view.topAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // scrollView
            scrollView.topAnchor.constraint(equalTo: header.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
