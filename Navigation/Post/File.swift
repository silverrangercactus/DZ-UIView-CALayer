//
//  File.swift
//  Navigation
//
//  Created by Fedor Boriskin on 20.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

struct Posts {
    var author: String
    var description: String
    var image: UIImage
    var likes: String
    var views: String
}

struct PostSection {
    var title: String
    var posts: [Posts]
}

struct PostView {
    static let tableModel = [
        PostSection(title: "МОЯ ЛЕНТА", posts: [
   
        Posts(author: "Fed", description: "Guess who's birthday is coming soon?",
              image: UIImage(named: "cactus2")!, likes: "Likes: 123", views: "Views: 124"),
        Posts(author: "Me", description: "Miss u ❤️‍🔥 ",
              image: UIImage(named: "cactus3")!, likes: "Likes: 2132", views: "Views: 2321"),
        Posts(author: "Amanda", description: "Haha it's me as a child",
              image: UIImage(named: "cactus1")!, likes: "Likes: 214", views: "Views: 234"),
        Posts(author: "Julia", description: "Need go to patry 🍾🍹🍷🎉",
              image: #imageLiteral(resourceName: "cactus4"), likes: "Likes: 193", views: "Views: 320")
    ])]
}




