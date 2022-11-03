//
//  Factory.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController
    
    init (navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
                
        let vc = LoginViewController()
    
        vc.loginDelegate = MyLoginFactory().produceLoginInspector()
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
 
    func pushToNavBarController (tapBarController : MainTabBarController ){
        navigationController.pushViewController(tapBarController, animated: true)
    }
    
}
