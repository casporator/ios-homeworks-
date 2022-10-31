//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit


class ProfileCoordinator {
 
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func startView() {
        
        let currentUserService = CurrentUserService()
        
        let photoCoordinator = PhotoCoordinator(navigationController: navigationController)
        
        let profileViewModel = ProfileViewModel(currentUser: currentUserService.user)

        let profileVC = ProfileViewController(photoCoordinator: photoCoordinator, profileViewModel: profileViewModel)
        navigationController.pushViewController(profileVC, animated: true)
    }
}

