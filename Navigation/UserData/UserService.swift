//
//  UserService.swift
//  Navigation
//
//  Created by Oleg Popov on 31.10.2022.
//

import Foundation
import UIKit

protocol UserService {

    func getLogin(userLogin: String, userPassword: String) -> User?

}
