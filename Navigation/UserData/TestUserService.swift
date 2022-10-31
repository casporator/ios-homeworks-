//
//  TestUserService.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

class TestUserService: UserService {
    
    let user: User = .init(userLogin: "test", userFullName: "Test Person", userAvatar: UIImage(named: "nonePhoto") ?? UIImage(), userStatus: "Test status test", userPassword: "test")
    
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

