//
//  TabBarController.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class MyTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let checker = RandomWord()

        self.setViewControllers([
            createTabBarItem(tabBarTitle: "Feed", tabBarImage: "house.fill", viewController: FeedViewController(checkerr: checker)),
            createTabBarItem(tabBarTitle: "Profile", tabBarImage: "person.fill", viewController: LogInViewController())], animated: false)
        }

        func createTabBarItem(tabBarTitle: String, tabBarImage: String, viewController: UIViewController) -> UINavigationController {
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem.title = tabBarTitle
            navigationController.tabBarItem.image = UIImage(systemName: tabBarImage)
            return navigationController
        }
    
    
    
}
    
    
    

