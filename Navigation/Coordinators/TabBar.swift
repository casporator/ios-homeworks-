//
//  TabBarCoordinator.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    let profile = ProfileTabCoordinator(navigationController: UINavigationController())
    let feed = FeedCoordinator(navigationController: UINavigationController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        profile.start()
        feed.start()
        setupTabBar()
                
        viewControllers = [profile.navigationController, feed.navigationController]
    }
    func setupTabBar(){
    UITabBar.appearance().tintColor = .systemBlue
    UITabBar.appearance().barTintColor = .white
    UITabBar.appearance().layer.borderColor = UIColor.darkGray.cgColor
    UITabBar.appearance().layer.borderWidth = 1
    UITabBar.appearance().layer.masksToBounds = true
    }
}
