//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
   
    var photo: Photo? {
        didSet {
            photoOne.image = photo?.image
        }
    }

    var photoOne: UIImageView = {
        let photoOne = UIImageView()
        photoOne.layer.cornerRadius = 6
        photoOne.translatesAutoresizingMaskIntoConstraints = false
        return photoOne
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(photoOne)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let constraints = [
            
            photoOne.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoOne.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoOne.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            photoOne.heightAnchor.constraint(equalTo: photoOne.widthAnchor),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


