//
//  LogInViewControllerDelegate.swift
//  Navigation
//
//  Created by Fedor Boriskin on 30.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

protocol LogInViewControllerDelegate {
    
    func checkLoginPass(enterLogin: String, enterPass: String) -> Bool
    
    func newButtonTapped(emailLogin: String, passwordLogin: String, completion: @escaping (LoginCheck) -> Void)
    
    func showCreateAccount(email: String, password: String, completion: @escaping (CreateLoginCheck) -> Void)
        
}
