//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Fedor Boriskin on 20.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    var posts: Posts? {
        didSet {
            postAuthor.text = posts?.author
            postImage.image = posts?.image
            postDescription.text = posts?.description
            postLikes.text = posts?.likes
            postViews.text = posts?.views
        }
    }
    
    var postAuthor: UILabel = {
        let postAuthor = UILabel()
        postAuthor.translatesAutoresizingMaskIntoConstraints = false
        postAuthor.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        postAuthor.textColor = .black
        postAuthor.numberOfLines = 2
        return postAuthor
    }()

    
    var postImage: UIImageView = {
        let postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        return postImage
    }()
    
    
    var postDescription: UILabel = {
        let postDescription = UILabel()
        postDescription.translatesAutoresizingMaskIntoConstraints = false
        postDescription.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        postDescription.textColor = .systemGray
        postDescription.numberOfLines = 0
        return postDescription
    }()
    
    
    var postLikes: UILabel = {
        let postLikes = UILabel()
        postLikes.translatesAutoresizingMaskIntoConstraints = false
        postLikes.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        postLikes.textColor = .black
        return postLikes
    }()
    
    var postViews: UILabel = {
        let postViews = UILabel()
        postViews.translatesAutoresizingMaskIntoConstraints = false
        postViews.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return postViews
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
        contentView.addSubview(postAuthor)
        contentView.addSubview(postImage)
        contentView.addSubview(postDescription)
        contentView.addSubview(postLikes)
        contentView.addSubview(postViews)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        let constraints = [
            
            postAuthor.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            postAuthor.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postImage.topAnchor.constraint(equalTo: postAuthor.bottomAnchor, constant: 12),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: postImage.widthAnchor),
            
            postDescription.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 19),
            postDescription.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postDescription.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            postLikes.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postLikes.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            postLikes.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            postViews.topAnchor.constraint(equalTo: postDescription.bottomAnchor, constant: 16),
            postViews.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            postViews.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}
