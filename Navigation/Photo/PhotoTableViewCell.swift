//
//  PhotoTableViewCell.swift
//  Navigation
//
//  Created by Fedor Boriskin on 27.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

   
    var photo: Photo? {
        didSet {
            photoOne.image = photo?.image1
            photoTwo.image = photo?.image2
            photoThree.image = photo?.image3
            photoFour.image = photo?.image4
        }
    }
    
    
    var photoLabel: UILabel = {
        let photoLabel = UILabel()
        photoLabel.tintColor = .black
        photoLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photoLabel.text = "Photos"
        photoLabel.translatesAutoresizingMaskIntoConstraints = false
        return photoLabel
    }()
    
    var photoButton: UIButton = {
        let photoButton = UIButton()
        photoButton.setBackgroundImage(UIImage(systemName: "arrow.right"), for: .normal)
        photoButton.translatesAutoresizingMaskIntoConstraints = false
        return photoButton
    }()
    
    var photoOne: UIImageView = {
        let photoOne = UIImageView()
        photoOne.layer.cornerRadius = 6
        photoOne.translatesAutoresizingMaskIntoConstraints = false
        return photoOne
    }()
    
    var photoTwo: UIImageView = {
        let photoTwo = UIImageView()
        photoTwo.layer.cornerRadius = 6
        photoTwo.translatesAutoresizingMaskIntoConstraints = false
        return photoTwo
    }()
    
    var photoThree: UIImageView = {
        let photoThree = UIImageView()
        photoThree.layer.cornerRadius = 6
        photoThree.translatesAutoresizingMaskIntoConstraints = false
        return photoThree
    }()
    
    var photoFour: UIImageView = {
        let photoFour = UIImageView()
        photoFour.layer.cornerRadius = 6
        photoFour.translatesAutoresizingMaskIntoConstraints = false
        return photoFour
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    func setupViews() {
        contentView.addSubview(photoLabel)
        contentView.addSubview(photoButton)
        contentView.addSubview(photoOne)
        contentView.addSubview(photoTwo)
        contentView.addSubview(photoThree)
        contentView.addSubview(photoFour)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let constraints = [
            
            photoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            photoButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photoButton.centerYAnchor.constraint(equalTo: photoLabel.centerYAnchor),
            
            photoOne.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoOne.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photoOne.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photoOne.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.22),
            photoOne.heightAnchor.constraint(equalTo: photoOne.widthAnchor),
            
            photoTwo.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoTwo.leadingAnchor.constraint(equalTo: photoOne.trailingAnchor, constant: 8),
            photoTwo.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.22),
            photoTwo.heightAnchor.constraint(equalTo: photoTwo.widthAnchor),
            
            photoThree.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoThree.leadingAnchor.constraint(equalTo: photoTwo.trailingAnchor, constant: 8),
            photoThree.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.22),
            photoThree.heightAnchor.constraint(equalTo: photoThree.widthAnchor),
            
            photoFour.topAnchor.constraint(equalTo: photoLabel.bottomAnchor, constant: 12),
            photoFour.leadingAnchor.constraint(equalTo: photoThree.trailingAnchor, constant: 8),
            photoFour.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.22),
            photoFour.heightAnchor.constraint(equalTo: photoFour.widthAnchor),
            
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
