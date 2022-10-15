//
//  User.swift
//  Navigation
//
//  Created by Oleg Popov on 15.10.2022.
//

import Foundation
import UIKit

protocol UserService {
    func loginCheck (login : String) -> User?
}

final class User {
    let login : String
    let fullName : String
    let avatar : UIImage
    let status : String
    
    init(login: String, fullName: String, avatar: UIImage, status: String) {
        self.login = login
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}


final class CurrentUserService: UserService {
    
    let incomingUser : User
    
    func loginCheck(login: String) -> User? {
        if incomingUser.login == login {
            
            return incomingUser
            
        }
        return nil
    }
    
    init(incomingUser: User) {
        self.incomingUser = incomingUser
        
    }
}

final class TestUserService: UserService {
    let incomingUser : User
    
    func loginCheck(login: String) -> User? {
        if incomingUser.login == login {
            
            return incomingUser
            
        }
        return nil
    }
    
    init(incomingUser: User) {
        self.incomingUser = incomingUser
        
    }
}
