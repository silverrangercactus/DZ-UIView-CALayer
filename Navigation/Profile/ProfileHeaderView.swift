//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    let avatarPicture = UIImage(named: "ava")
    var title: String = ""
    
    @IBOutlet weak var avatarImage: UIImageView! {
        didSet {
            avatarImage.image = avatarPicture
            avatarImage.layer.masksToBounds = true
            avatarImage.layer.cornerRadius = 60
            avatarImage.layer.borderWidth = 3
            avatarImage.layer.borderColor = UIColor.white.cgColor
           
        }
    }
    
    @IBOutlet weak var topicView: UITextView! {
        didSet {
            topicView.text = "Miss cowboy Cactus"
            topicView.backgroundColor = .none
            topicView.textColor = .black
            topicView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
            topicView.textAlignment = .left
        }
    }
    
    @IBOutlet weak var button: UIButton! {
        didSet {
            button.layer.cornerRadius = 10
            button.backgroundColor = .systemBlue
            button.setTitleColor(.white, for: .normal)
            button.setTitle("Show status", for: .normal)
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOffset = CGSize(width: 10, height: 10)
            button.layer.shadowOpacity = 0.7
            button.layer.shadowRadius = 10
        }
    }
    
    @IBOutlet weak var commentView: UITextView! {
        didSet {
            commentView.text = "I will wait your text"
            commentView.backgroundColor = .none
            commentView.textColor = .gray
            commentView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            commentView.textAlignment = .left
        }
    }
  
    
    @IBOutlet weak var setStatusView: UITextField! {
        didSet {
            setStatusView.placeholder = "Set status"
            setStatusView.backgroundColor = .none
            setStatusView.layer.masksToBounds = true
            setStatusView.layer.backgroundColor = .none
            setStatusView.tintColor = .black
            setStatusView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
            setStatusView.layer.cornerRadius = 12
            setStatusView.layer.borderWidth = 1
            setStatusView.layer.borderColor = UIColor.black.cgColor
        }
    }
 
    
    @IBAction func statusAction(_ sender: Any) {
        title = setStatusView.text ?? ""
    }
    
    
    @IBAction func actionButton(_ sender: Any) {
        commentView.text = title
    }
}

    
