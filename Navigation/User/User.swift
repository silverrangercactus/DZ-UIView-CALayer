//
//  User.swift
//  Navigation
//
//  Created by Fedor Boriskin on 27.09.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class User {
    var name: String
    var avatar: UIImage
    var status: String
    
    init(name: String, avatar: UIImage, status: String) {
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}




