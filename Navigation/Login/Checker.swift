//
//  Checker.swift
//  Navigation
//
//  Created by Oleg Popov on 18.10.2022.
//

import Foundation


class Checker {
    static let shared = Checker()
    
    private let currentLogin: String
    private let currentPassword: String
    
    private init() {
        currentLogin = "1"
        currentPassword = "1"
    }
    
    func checkLogin(login: String, password: String) -> Bool {
        return login == currentLogin && password == currentPassword ? true : false
    }
}

        

