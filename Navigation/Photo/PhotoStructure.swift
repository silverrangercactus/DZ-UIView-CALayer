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
    
    var image1 = UIImage(named: "Файл 1")
    var image2 = UIImage(named: "Файл 2")
    var image3 = UIImage(named: "Файл 3")
    var image4 = UIImage(named: "Файл 4")
}

struct PhotoSection {
    var title: String
    var photos: [Photo]
}

struct PhotoView {
    static let allPhoto = [
        PhotoSection(title: "Мои Фото", photos: [
    
    Photo(image: UIImage(named: "Файл 1")!),
    Photo(image: UIImage(named: "Файл 2")!),
    Photo(image: UIImage(named: "Файл 3")!),
    Photo(image: UIImage(named: "Файл 4")!),
    Photo(image: UIImage(named: "Файл 5")!),
    Photo(image: UIImage(named: "Файл 6")!),
    Photo(image: UIImage(named: "Файл 7")!),
    Photo(image: UIImage(named: "Файл 8")!),
    Photo(image: UIImage(named: "Файл 9")!),
    Photo(image: UIImage(named: "Файл 10")!),
    Photo(image: UIImage(named: "Файл 11")!),
    Photo(image: UIImage(named: "Файл 12")!),
    Photo(image: UIImage(named: "Файл 13")!),
    Photo(image: UIImage(named: "Файл 14")!),
    Photo(image: UIImage(named: "Файл 15")!),
    Photo(image: UIImage(named: "Файл 16")!),
    Photo(image: UIImage(named: "Файл 17")!),
    Photo(image: UIImage(named: "Файл 18")!),
    Photo(image: UIImage(named: "Файл 19")!),
    Photo(image: UIImage(named: "Файл 20")!)
    ]) 
    ]
}
