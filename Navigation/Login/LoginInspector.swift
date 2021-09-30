//
//  LoginInspector.swift
//  Navigation
//
//  Created by Fedor Boriskin on 30.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

class LoginInspector: LogInViewControllerDelegate {
    
    func checkLoginPass(enterLogin: String, enterPass: String) -> Bool {
        if CheckerUser.singleton.checkPass(enterLogin: enterLogin, enterPassword: enterPass) == true {
            return true
        } else {
            return false
        }
    }
}
    
    
  
