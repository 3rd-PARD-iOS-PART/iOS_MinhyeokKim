//
//  HomeViewController.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/28.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clear
        setUI()
    }
    
    func setUI(){
        // scrollView
        let scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.contentInsetAdjustmentBehavior = .never // safeArea 영역 무시 -> 상태바까지 scrollView가 채워질 수 있도록
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
        
        // contentView (header, collecitonView)
        let contentView: UIView = {
            let contentView = UIView()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            return contentView
        }()
        
        // header
        let header = HeaderComponent()
        header.translatesAutoresizingMaskIntoConstraints = false
        
        // collectionView
        let collectionView = CollectiViewComponent()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // addSubview
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(header)
        contentView.addSubview(collectionView)
        
        header.viewController = parent
        
        //constraints
        NSLayoutConstraint.activate([
            // scrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            // contentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor), // Ensure contentView stretches to fit scrollView
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            // header
            header.topAnchor.constraint(equalTo: contentView.topAnchor),
            header.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            header.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            // collectionView
            collectionView.topAnchor.constraint(equalTo: header.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
}




