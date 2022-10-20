//
//  User.swift
//  Navigation
//
//  Created by Oleg Popov on 15.10.2022.
//

import Foundation
import UIKit


final class User {

    let fullName : String
    let avatar : UIImage
    let status : String
    
    init(fullName: String, avatar: UIImage, status: String) {
        
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}


final class CurrentUserService {
    
    let incomingUser : User
    
    init(incomingUser: User) {
        self.incomingUser = incomingUser
        
    }
}

final class TestUserService {
    let incomingUser : User
    
   
    init(incomingUser: User) {
        self.incomingUser = incomingUser
        
    }
}
