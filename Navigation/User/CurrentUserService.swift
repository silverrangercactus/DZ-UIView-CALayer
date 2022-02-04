//
//  CurrentUserService.swift
//  Navigation
//
//  Created by Fedor Boriskin on 27.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class CurrentUserService: UserService {
   
    var myUser = User(name: "MissCactus", avatar: UIImage(named: "ava")!, status: "Take it easy")
    
    func returnUser(name: String) -> User? {
        if name == myUser.name {
            return myUser
        }
            return nil
    }
}
