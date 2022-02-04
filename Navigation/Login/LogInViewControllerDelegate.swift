//
//  LogInViewControllerDelegate.swift
//  Navigation
//
//  Created by Fedor Boriskin on 30.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol LogInViewControllerDelegate {
    
    func checkLoginPass(enterLogin: String, enterPass: String) -> Bool
    
}
