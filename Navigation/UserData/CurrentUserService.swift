//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit


class CurrentUserService: UserService {
    
    let user: User = .init(userLogin: "123", userFullName: "пипин", userAvatar: UIImage(named: "pipin") ?? UIImage(), userStatus: "Мои шесть кубиков защищены слоем жира", userPassword: "123")
    
    func getLogin(userLogin: String, userPassword: String) -> User? {
        
        if userLogin == user.userLogin, userPassword == user.userPassword {
            return user
        }
        else {
            print("не правильный логин или пароль")
            return nil
        }
    }
}

