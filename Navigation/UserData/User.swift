//
//  User.swift
//  Navigation
//
//  Created by Oleg Popov on 15.10.2022.
//

import Foundation
import UIKit

class User {
   
    var userFullName: String
    var userAvatar: UIImage
    var userStatus: String
  
    
    init(userFullName: String, userAvatar: UIImage, userStatus: String) {
        
        self.userFullName = userFullName
        self.userAvatar = userAvatar
        self.userStatus = userStatus
     
    }

}
