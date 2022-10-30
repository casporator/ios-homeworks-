//
//  Checker.swift
//  Navigation
//
//  Created by Oleg Popov on 18.10.2022.
//

import Foundation


class Checker {
    static let shared = Checker()
    
    private let login = "1"
    private let password = "1"
    
    func checkLogin(login: String, password: String) -> Bool {
        self.login == login && self.password == password ? true : false
    }
    
    private init(){
        
    }
}
        

