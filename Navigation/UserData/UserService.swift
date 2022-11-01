//
//  UserService.swift
//  Navigation
//
//  Created by Oleg Popov on 01.11.2022.
//

import Foundation
import UIKit


protocol UserService {
    
    func returnUser (userName: String) -> User?
    
}
