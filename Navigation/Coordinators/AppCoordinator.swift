//
//  AppCoordinator.swift
//  Navigation
//
//  Created by Fedor Boriskin on 30.11.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var coordinators: [Coordinator] = []
    let mainViewController: MyTabBarController
    private let factory = ControllerFatoryImpl()
    
    init() {
        mainViewController = MyTabBarController()
        
        let feedCoordinator = configureFeed()
        let logInCoordinator = configureLogIn()
        
        mainViewController.viewControllers = [ feedCoordinator.navigationController, logInCoordinator ]
        
        feedCoordinator.start()
    }
    
    private func configureFeed() -> FeedFlowCoordinator {
        let navigationFirst = UINavigationController()
        navigationFirst.tabBarItem = UITabBarItem(title: "Feed", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        let coordinator = FeedFlowCoordinator(navigationController: navigationFirst, factory: factory)
        return coordinator
    }
    
    private func configureLogIn() -> UINavigationController {
        let logInController = LogInViewController()
        let navigationSecond = UINavigationController(rootViewController: logInController)
        logInController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person.fill"), selectedImage: nil)
        return navigationSecond
    }
    
}
