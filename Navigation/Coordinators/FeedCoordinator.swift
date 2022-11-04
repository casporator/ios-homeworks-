//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

class FeedCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    init (navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        
        let vc = FeedViewController()
        vc.tabBarItem = UITabBarItem(title: "Лента", image: UIImage(systemName: "doc.text"), tag: 1)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func openPostViewController () {
        let child = PostViewCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    
    func childDidFinish (_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    
}
