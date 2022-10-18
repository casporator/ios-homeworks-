//
//  Checker.swift
//  Navigation
//
//  Created by Oleg Popov on 18.10.2022.
//

import Foundation
import UIKit

protocol LoginViewControllerDelegate{
    func checkLogin(what controller: LoginViewController,
        login : String) -> Bool

    func checkPassword(what controller: LoginViewController,
                   password : String) -> Bool
 }


class Checker {
    static let cheker = Checker()

    private let login : String = "login"
    private let password: String = "password"

    func checkLogin(login : String) -> Bool {
        self.login == login ? true : false
    }
    func checkPassword(password : String) -> Bool {
        self.password == password ? true : false
    }
    private init(){

    }
}
