//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileHeaderView: UIView {

    let button = UIButton()
    let avatarPicture = UIImage(named: "ava")
    let avatarView = UIImageView()
    let topicView = UITextView()
    let commentView = UITextView()
    let setStatusView = UITextField()
    var tittle = String()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = CGRect(x: 16, y: safeAreaInsets.top + 152, width: self.frame.width - 32, height: 50)
        avatarView.frame = CGRect(x: 16, y: self.safeAreaInsets.top + 16, width: 120, height: 120)
        topicView.frame = CGRect(x: self.frame.width/3, y: self.safeAreaInsets.top + 27, width: 250, height: 30)
        commentView.frame = CGRect(x: self.frame.width/3, y: safeAreaInsets.top + 84, width: 250, height: 30)
        setStatusView.frame = CGRect(x: self.frame.width/3 + 10, y: safeAreaInsets.top + 110, width: 250, height: 40)
        
    }
    
    private func setupViews() {
        addSubview(button)
        addSubview(avatarView)
        addSubview(topicView)
        addSubview(commentView)
        addSubview(setStatusView)
        
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Show status", for: .normal)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 10, height: 10)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 10
        button.addTarget(self, action: #selector(actionButtonPressed), for: .touchUpInside)
        
        avatarView.image = avatarPicture
        avatarView.layer.masksToBounds = true
        avatarView.layer.cornerRadius = 60
        avatarView.layer.borderWidth = 3
        avatarView.layer.borderColor = UIColor.white.cgColor
        
        topicView.text = "Miss cowboy Cactus"
        topicView.backgroundColor = nil
        topicView.textColor = .black
        topicView.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        topicView.textAlignment = .left
        
        commentView.text = "I will wait your text"
        commentView.backgroundColor = nil
        commentView.textColor = .gray
        commentView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        commentView.textAlignment = .left
        
       
        setStatusView.placeholder = "Set status"
        setStatusView.backgroundColor = .white
        setStatusView.tintColor = .black
        setStatusView.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        setStatusView.layer.cornerRadius = 12
        setStatusView.layer.borderWidth = 1
        setStatusView.layer.borderColor = UIColor.black.cgColor
        setStatusView.addTarget(self, action: #selector(actionButtonSetStatus), for: .editingChanged)
    }
    
    
    @objc func actionButtonPressed() {
        commentView.text = tittle
        
    }
    
    @objc func actionButtonSetStatus(_ textField: UITextField) {
        tittle = textField.text!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
