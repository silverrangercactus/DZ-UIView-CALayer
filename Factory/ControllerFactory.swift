//
//  ControllerFactory.swift
//  Navigation
//
//  Created by Fedor Boriskin on 01.12.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol ControllerFactory {
   
    func makeFeed() -> FeedViewController
    
}

struct ControllerFatoryImpl: ControllerFactory {
   
    
    func makeFeed() -> FeedViewController {
        let checkerr = RandomWord()
        let feedController = FeedViewController(checkerr: checkerr)
        return feedController
    }
    
}
