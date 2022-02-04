//
//  Coordinator.swift
//  Navigation
//
//  Created by Fedor Boriskin on 01.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol Coordinator: AnyObject {
    var coordinators: [Coordinator] { get set }
}
