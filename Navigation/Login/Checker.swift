//
//  Checker.swift
//  Navigation
//
//  Created by Fedor Boriskin on 30.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class CheckerUser {
    
    static var singleton = CheckerUser()
    
    private let login = "111"
    
    private let password = "222"
    
    private init() {}
    
    func checkPass(enterLogin: String, enterPassword: String) -> Bool {
        if enterLogin == login && enterPassword == password {
            return true
        } else {
            return false
        }
    }
}
