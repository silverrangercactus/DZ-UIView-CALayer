//
//  LoginInspector.swift
//  Navigation
//
//  Created by Fedor Boriskin on 30.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import FirebaseAuth

enum LoginCheck {
    case loginError, loginGood
}

enum CreateLoginCheck {
    case good, error
}


class LoginInspector: LogInViewControllerDelegate {
        
    func checkLoginPass(enterLogin: String, enterPass: String) -> Bool {
        if CheckerUser.singleton.checkPass(enterLogin: enterLogin, enterPassword: enterPass) == true {
            return true
        } else {
            return false
        }
    }

    func newButtonTapped(emailLogin: String, passwordLogin: String, completion: @escaping (LoginCheck) -> Void) {
        FirebaseAuth.Auth.auth().signIn(withEmail: emailLogin, password: passwordLogin) { (result, error) in
            if error != nil {
                print("Error")
                completion(.loginError)
            }
            
            if result != nil {
                print("OK")
                completion(.loginGood)
            }
        }
    }
        

    
    func showCreateAccount(email: String, password: String, completion: @escaping (CreateLoginCheck) -> Void) {
        
                FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {  result, error in
                    
                    if error != nil {
                        //print("Account creation false")
                        completion(.error)
                    }
                    if result != nil {
                        //print("Account created, you have signed in")
                        completion(.good)
                    }
                })
        }
}


