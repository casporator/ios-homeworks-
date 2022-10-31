//
//  TabBarCoordinator.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import UIKit

class TabBarController: UITabBarController {

    private let profileVC = Factory(navigationController: UINavigationController(), viewController: .profile)
    private let feedVC = Factory(navigationController: UINavigationController(), viewController: .feed)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setControllers()
    }
    
    func setControllers() {
        viewControllers = [
            profileVC.navigationController,
            feedVC.navigationController
        ]
    }
}
