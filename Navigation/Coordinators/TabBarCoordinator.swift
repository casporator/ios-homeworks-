//
//  TabBarCoordinator.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

protocol TabCoordinatorProtocol: Coordinator {
    var tabBarControler: UITabBarController { get set }
}

class TabCoordinator: Coordinator {
    var finishDelegate: CoordinatorFinishDelegate?
    
    var navigationController: UINavigationController
    
    var childCoordinators: [Coordinator] = []
    
    var tabBarController = TabBarController()
    
    var type: CoordinatorType { .tab }
    
    required init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
  
    func start() {
       showTabBarController()
    }
    
    func showTabBarController() {
        navigationController.pushViewController(tabBarController, animated: true)
    }
}
