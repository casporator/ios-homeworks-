//
//  LoginViewControllerDelegate.swift
//  Navigation
//
//  Created by Oleg Popov on 30.10.2022.
//

import Foundation

protocol LoginViewControllerDelegate: AnyObject {
    func checkLogin(login: String, password: String) -> Bool
}
