//
//  TabBarController.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

final class TabBarController: UITabBarController {
    
    
    var firstTabNavidationController: UINavigationController!
    var secondTabNavigationController: UINavigationController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        
        let loginVC = LoginViewController()
        loginVC.loginDelegate = MyLoginFactory().produceLoginInspector()
        let currentUser = CurrentUserService()
        let profileVC = ProfileViewController(currentUser: currentUser.user)
        
        firstTabNavidationController = UINavigationController.init(rootViewController: FeedViewController())
        secondTabNavigationController = UINavigationController.init(rootViewController: profileVC)

        viewControllers = [firstTabNavidationController, secondTabNavigationController]
        
        let item1 = UITabBarItem(title: "Лента", image: UIImage(systemName: "rectangle.3.group.bubble.left"), tag: 0)
        let item2 = UITabBarItem(title: "Профиль", image:  UIImage(systemName: "person.crop.circle"), tag: 1)
        
        firstTabNavidationController.tabBarItem = item1
        secondTabNavigationController.tabBarItem = item2
        
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().barTintColor = .systemGray4
        UITabBar.appearance().layer.borderColor = UIColor.darkGray.cgColor
        UITabBar.appearance().layer.borderWidth = 1
        UITabBar.appearance().layer.masksToBounds = true
        UITabBar.appearance().backgroundColor = .white
    }
    
}


