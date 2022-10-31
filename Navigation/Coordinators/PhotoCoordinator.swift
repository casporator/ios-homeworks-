//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//


import Foundation
import UIKit

class PhotoCoordinator {
 
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func showView() {
        
        let photoViewController = PhotosViewController()
        photoViewController.title = "Photo Gallery"
        navigationController.pushViewController(photoViewController, animated: true)
    }
}
