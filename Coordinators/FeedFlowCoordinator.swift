//
//  FeedCoordinator.swift
//  Navigation
//
//  Created by Fedor Boriskin on 30.11.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

final class FeedFlowCoordinator: Coordinator {
   
    var coordinators: [Coordinator] = []
    let navigationController: UINavigationController
    private let factory: ControllerFactory

    
    init(navigationController: UINavigationController, factory: ControllerFactory) {
        self.navigationController = navigationController
        self.factory = factory
    }
    
    func start() {
        let feedController = factory.makeFeed()
        navigationController.pushViewController(feedController, animated: true)
    }
}

