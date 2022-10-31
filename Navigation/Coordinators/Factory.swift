//
//  Factory.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

class Factory {
    enum Views {
        case profile
        case feed
    }
    
    let navigationController: UINavigationController
    let viewController: Views
    
    init(navigationController: UINavigationController, viewController: Views) {
        self.navigationController = navigationController
        self.viewController = viewController
        startModule()
    }
    
    func startModule() {
        
        switch viewController {
        case .profile:
            
            let profileCoordinator = ProfileCoordinator(navigationController: navigationController)
            let controller = LoginViewController(coordinator: profileCoordinator)
            controller.loginDelegate = MyLoginFactory().produceLoginInspector()
            navigationController.tabBarItem = .init(title: "Профиль", image: UIImage(systemName: "person"), tag: 1)
            navigationController.setViewControllers([controller], animated: true)
            
        case .feed:
            let feedCoordinator = FeedCoordinator()
            let controller = FeedViewController(coordinator: feedCoordinator)
            navigationController.tabBarItem = .init(title: "Лента", image: UIImage(named: "rectangle.3.group.bubble.left"), tag: 0)
            navigationController.setViewControllers([controller], animated: true)
        }
    }
}
