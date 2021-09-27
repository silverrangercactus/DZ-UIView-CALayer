//
//  TestUserService.swift
//  Navigation
//
//  Created by Fedor Boriskin on 27.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class TestUserService: UserService {
    
    var testUser = User(name: "Test", avatar: UIImage(named: "testAva")!, status: "OLOLO")
    
    func returnUser(name: String) -> User? {
        return testUser
    }
}
