//
//  LoginFactory.swift
//  Navigation
//
//  Created by Oleg Popov on 30.10.2022.
//

import Foundation
import UIKit

protocol LoginFactory {
    
    func produceLoginInspector() -> LoginInspector
}

class MyLoginFactory: LoginFactory {
    func produceLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
}
