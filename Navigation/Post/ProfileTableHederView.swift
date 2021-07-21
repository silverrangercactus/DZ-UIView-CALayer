//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Fedor Boriskin on 21.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileTableHederView: UIView {


    var title: String = ""
    
    var allView: UIView = {
        let allView = UIView()
        allView.backgroundColor = .lightGray
        return allView
    }()
    
    var avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "ava")
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = 60
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        return avatarImage
    }()
    
    var titleName: UILabel = {
        let titleName = UILabel()
        titleName.text = "Miss cowboy Cactus"
        titleName.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        titleName.textColor = .black
        return titleName
    }()
    
    var commentView: UILabel = {
        let commentView = UILabel()
        commentView.text = "I will wait your text"
        commentView.textColor = .darkGray
        commentView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return commentView
    }()
    
    var setStatusView: UITextField = {
        let setStatusView = UITextField()
        setStatusView.placeholder = "Set status"
        setStatusView.backgroundColor = .none
        setStatusView.layer.masksToBounds = true
        setStatusView.layer.backgroundColor = UIColor.white.cgColor
        setStatusView.tintColor = .black
        setStatusView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        setStatusView.layer.cornerRadius = 12
        setStatusView.layer.borderWidth = 1
        setStatusView.layer.borderColor = UIColor.black.cgColor
        setStatusView.addTarget(self, action: #selector(statusSet), for: .editingChanged)
        return setStatusView
    }()
    
    var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Show status", for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 10
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        return button
    }()
    
    @objc func actionButton() {
        commentView.text = title
        
    }
    
    @objc func statusSet(_ textField: UITextField) {
        title = setStatusView.text ?? ""
        
    }
    
    override func layoutSubviews() {
            super.layoutSubviews()

        addSubview(allView)
        allView.addSubview(titleName)
        allView.addSubview(avatarImage)
        allView.addSubview(commentView)
        allView.addSubview(setStatusView)
        allView.addSubview(button)
        
        allView.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        titleName.translatesAutoresizingMaskIntoConstraints = false
        commentView.translatesAutoresizingMaskIntoConstraints = false
        setStatusView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
            NSLayoutConstraint.activate([
                allView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
                allView.leadingAnchor.constraint(equalTo: leadingAnchor),
                allView.trailingAnchor.constraint(equalTo: trailingAnchor),
                allView.heightAnchor.constraint(equalToConstant: 210),
        
              
                avatarImage.leadingAnchor.constraint(equalTo: allView.leadingAnchor, constant: 16),
                avatarImage.topAnchor.constraint(equalTo: allView.topAnchor, constant: 20),
                avatarImage.widthAnchor.constraint(equalToConstant: 120),
                avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
                
                titleName.topAnchor.constraint(equalTo: allView.topAnchor, constant: 20),
                titleName.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
                titleName.trailingAnchor.constraint(equalTo: allView.trailingAnchor, constant: -16),
                
                commentView.topAnchor.constraint(equalTo: titleName.bottomAnchor, constant: 20),
                commentView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
                commentView.trailingAnchor.constraint(equalTo: allView.trailingAnchor, constant: -16),
                
                setStatusView.topAnchor.constraint(equalTo: commentView.bottomAnchor, constant: 20),
                setStatusView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
                setStatusView.trailingAnchor.constraint(equalTo: allView.trailingAnchor, constant: -16),
                setStatusView.heightAnchor.constraint(equalToConstant: 30),
                
                button.leadingAnchor.constraint(equalTo: allView.leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: allView.trailingAnchor, constant: -16),
                button.bottomAnchor.constraint(equalTo: allView.bottomAnchor, constant: -16),
                button.heightAnchor.constraint(equalToConstant: 40)

            ])
        }

}
