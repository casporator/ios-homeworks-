//
//  File.swift
//  Navigation
//
//  Created by Oleg Popov on 02.11.2022.
//

import Foundation
import UIKit

class InfoCoordinator {
 
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    
    func showView() {
        
        let infoViewController = InfoViewController()
        infoViewController.title = "Photo Gallery"
        navigationController.pushViewController(infoViewController, animated: true)
    }
}
