//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit


class CurrentUserService: UserService {
    
    let user: User = .init(userFullName: "Mr.Pipin", userAvatar: UIImage(named: "pipin") ?? UIImage(), userStatus: "Мои шесть кубиков защищены слоем жира")
    
    func returnUser(userName: String) -> User? {
        
       if userName == user.userFullName {
            return user
        }
            return nil
    }
    
}
   

