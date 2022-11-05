//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

class ProfileTabCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    
    init (navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        let currentUserService = CurrentUserService()
        let profileViewModel = ProfileViewModel(currentUser: currentUserService.user)
        let vc = ProfileViewController(profileViewModel: profileViewModel)
        
        vc.tabBarItem = UITabBarItem(title: "Профиль", image: UIImage(systemName: "person"), tag: 0)
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
    
    func openPhotosViewController (){
        let vc = PhotosViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
        
    }
}

