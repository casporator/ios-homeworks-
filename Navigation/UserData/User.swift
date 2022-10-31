//
//  User.swift
//  Navigation
//
//  Created by Oleg Popov on 15.10.2022.
//

import Foundation
import UIKit

class User {

    var userLogin: String
    var userFullName: String
    var userAvatar: UIImage
    var userStatus: String
    var userPassword: String
    
    init(userLogin: String, userFullName: String, userAvatar: UIImage, userStatus: String, userPassword: String) {
        self.userLogin = userLogin
        self.userFullName = userFullName
        self.userAvatar = userAvatar
        self.userStatus = userStatus
        self.userPassword = userPassword
    }

}
