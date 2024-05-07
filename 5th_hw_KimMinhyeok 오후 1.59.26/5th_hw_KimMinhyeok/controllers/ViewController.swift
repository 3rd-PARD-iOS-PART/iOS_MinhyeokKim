//
//  ViewController.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/03/28.
//

import UIKit

// tabBar 및 tabView 설정
class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        if #available(iOS 15, *) {
            // NavigationBar
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithOpaqueBackground()
            navigationBarAppearance.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : UIColor.white
            ]
            navigationBarAppearance.backgroundColor = UIColor.black
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
            
            // TabBar
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            tabBarAppearance.backgroundColor = UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1.0)
            // 선택된 탭
            tabBarAppearance.stackedLayoutAppearance.selected.iconColor = UIColor.white
            tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            // 선택되지 않은 탭
            let unselectedColor = UIColor(red: 140/255, green: 135/255, blue: 135/255, alpha: 1.0)
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [NSAttributedString.Key.foregroundColor: unselectedColor]
            
            UITabBar.appearance().standardAppearance = tabBarAppearance
        }
        
        setTabBar()
    }
    func setTabBar() {
        let vc1 = UINavigationController(rootViewController: HomeViewController())
        let vc2 = UINavigationController(rootViewController: SearchViewController())
        let vc3 = UINavigationController(rootViewController: ComingSoonViewController())
        let vc4 = UINavigationController(rootViewController: DownLoadViewController())
        let vc5 = UINavigationController(rootViewController: MoreViewController())
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        
        // Tab Bar items
        guard let tabBarItems = self.tabBar.items else { return }
        tabBarItems[0].image = UIImage(named: "home")
        tabBarItems[1].image = UIImage(named: "search")
        tabBarItems[2].image = UIImage(named: "coming_soon")
        tabBarItems[3].image = UIImage(named: "download")
        tabBarItems[4].image = UIImage(named: "more")
        tabBarItems[0].title = "Home"
        tabBarItems[1].title = "Search"
        tabBarItems[2].title = "ComingSoon"
        tabBarItems[3].title = "Downloads"
        tabBarItems[4].title = "More"
    }
}
