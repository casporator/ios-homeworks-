//
//  Checker.swift
//  Navigation
//
//  Created by Oleg Popov on 18.10.2022.
//

import Foundation

protocol LoginViewControllerDelegate{
    func checkLogin(controller: LoginViewController,
                    login: String, password: String) -> Bool
}

class Checker {
    static let cheker = Checker()
    
    private let login = "1234"
    private let password = "1234"
    
    func checkLogin(login: String, password: String) -> Bool {
        self.login == login && self.password == password ? true : false
    }
    
    private init(){
        
    }
}

struct LoginInspector: LoginViewControllerDelegate {
    func checkLogin(controller: LoginViewController,
                    login: String, password: String) -> Bool {
        return Checker.cheker.checkLogin(login: login, password: password)
        
    }
}
        

