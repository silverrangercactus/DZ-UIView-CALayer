//
//  PhotoStructure.swift
//  Navigation
//
//  Created by Fedor Boriskin on 27.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit


struct Photo {
    var image: UIImage
    
    var image1 = UIImage(named: "Cactuss1")
    var image2 = UIImage(named: "Cactuss2")
    var image3 = UIImage(named: "Cactuss3")
    var image4 = UIImage(named: "Cactuss4")
}

struct PhotoSection {
    var title: String
    var photos: [Photo]
}

struct PhotoView {
    static let allPhoto = [
        PhotoSection(title: "Мои Фото", photos: [
    
    Photo(image: UIImage(named: "Cactuss1")!),
    Photo(image: UIImage(named: "Cactuss2")!),
    Photo(image: UIImage(named: "Cactuss3")!),
    Photo(image: UIImage(named: "Cactuss4")!),
    Photo(image: UIImage(named: "Cactuss5")!),
    Photo(image: UIImage(named: "Cactuss6")!),
    Photo(image: UIImage(named: "Cactuss7")!),
    Photo(image: UIImage(named: "Cactuss8")!),
    Photo(image: UIImage(named: "Cactuss9")!),
    Photo(image: UIImage(named: "Cactuss10")!),
    Photo(image: UIImage(named: "Cactuss11")!),
    Photo(image: UIImage(named: "Cactuss12")!),
    Photo(image: UIImage(named: "Cactuss13")!),
    Photo(image: UIImage(named: "Cactuss14")!),
    Photo(image: UIImage(named: "Cactuss15")!),
    Photo(image: UIImage(named: "Cactuss16")!),
    Photo(image: UIImage(named: "Cactuss17")!),
    Photo(image: UIImage(named: "Cactuss18")!),
    Photo(image: UIImage(named: "Cactuss19")!),
    Photo(image: UIImage(named: "Cactuss20")!)
    ]) 
    ]
}
