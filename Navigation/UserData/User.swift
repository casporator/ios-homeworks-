//
//  User.swift
//  Navigation
//
//  Created by Oleg Popov on 15.10.2022.
//

import Foundation
import UIKit

final class User {

    let userName : String
    let avatar : UIImage
    let status : String
    
    init(userName: String, avatar: UIImage, status: String) {
        
        self.userName = userName
        self.avatar = avatar
        self.status = status
    }
}
