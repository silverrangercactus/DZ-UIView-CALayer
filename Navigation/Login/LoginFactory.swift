//
//  LoginFactory.swift
//  Navigation
//
//  Created by Fedor Boriskin on 30.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol LoginFactory {
    
    func factoryLogin() -> LoginInspector
    
}



class MyLoginFactory: LoginFactory {
    
    static let myLoginFactory = MyLoginFactory()
    
    func factoryLogin() -> LoginInspector {
        return LoginInspector()
    }
    
}
