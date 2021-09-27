//
//  UserService.swift
//  Navigation
//
//  Created by Fedor Boriskin on 27.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation

protocol UserService {
    func returnUser(name: String) -> User?
}
