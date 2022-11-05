//
//  LoginInspector.swift
//  Navigation
//
//  Created by Oleg Popov on 30.10.2022.
//

import Foundation
import UIKit

class LoginInspector: LoginViewControllerDelegate {
    func checkLogin(login: String, password: String) -> Bool {
        return Checker.shared.checkLogin(login: login, password: password)
        
    }
}
