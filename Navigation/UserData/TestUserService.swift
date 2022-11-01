//
//  TestUserService.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

class TestUserService: UserService {
    
    let user: User = .init(userFullName: "Test Person", userAvatar: UIImage(named: "nonePhoto") ?? UIImage(), userStatus: "Test status test")
    
    func returnUser(userName: String) -> User? {
        
       if userName == user.userFullName {
            return user
        }
            return nil
    }
}
  
