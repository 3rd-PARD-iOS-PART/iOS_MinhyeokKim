//
//  NavigationController.swift
//  3rd_hw_KimMinhyeok
//
//  Created by Minhyeok Kim on 2024/04/04.
//

import UIKit

class NavigationController {
    static let shared = NavigationController()

    private init() {}

    func pushViewController(_ viewController: UIViewController, from sourceViewController: UIViewController, animated: Bool = true) {
        sourceViewController.navigationController?.pushViewController(viewController, animated: animated)
    }
}
