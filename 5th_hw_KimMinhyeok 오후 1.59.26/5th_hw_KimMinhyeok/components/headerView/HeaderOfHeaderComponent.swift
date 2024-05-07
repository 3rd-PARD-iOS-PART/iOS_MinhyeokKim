//
//  HeaderOfHeaderComponent.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/04.
//

import UIKit

class HeaderOfHeaderComponent: UIView {
    
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
            let headerOfHeader = UIStackView()
            headerOfHeader.axis = .horizontal // 가로 정렬
            headerOfHeader.spacing = 40 // content간 간격: 40
            headerOfHeader.translatesAutoresizingMaskIntoConstraints = false
            
            let logo: UIImageView = {
                let logo = UIImageView()
                logo.image = UIImage(named: "netflix_logo")
                logo.contentMode = .scaleAspectFit
                logo.clipsToBounds = true
                logo.translatesAutoresizingMaskIntoConstraints = false
                
                return logo
            }()
            headerOfHeader.addArrangedSubview(logo)
            
            logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            let titles = ["TV Shows", "Movies", "My List"]
            for title in titles {
                let button: UIButton = {
                    let button = UIButton()
                    button.backgroundColor = .clear
                    button.setTitle(title, for: .normal)
                    button.setTitleColor(.white, for: .normal)
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 17.2, weight: .regular)
                    button.translatesAutoresizingMaskIntoConstraints = false
                    
                    // 화면 전환
                    button.addTarget(self, action: #selector(headerButtonTapped(_:)), for: .touchUpInside)
                    
                    return button
                }()
                headerOfHeader.addArrangedSubview(button)
                
                button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            }
            
            return headerOfHeader
        }()
    }
    
    @objc func headerButtonTapped(_ sender: UIButton) {
        if let title = sender.title(for: .normal), let viewController = viewController {
            print("\(title) 버튼이 탭되었습니다.")
            
            switch title {
            case "TV Shows":
                let tvShowsViewController = TVShowsViewController()
                NavigationController.shared.setRootViewController(tvShowsViewController, from: viewController)
                break
            case "Movies":
                let moviesViewController = ViewController()
                NavigationController.shared.setRootViewController(moviesViewController, from: viewController)
                break
            case "My List":
                let myListViewController = MyListViewController()
                NavigationController.shared.setRootViewController(myListViewController, from: viewController)
                break
            default:
                break
            }
        }
    }
}
