//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Fedor Boriskin on 21.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

protocol ProfileTableHeaderViewDelegate: AnyObject {
   
    var viewW: UIView? {get set}
    
    var tableW: UITableView? {get set}

}

class ProfileTableHederView: UIView {

    weak var delegate: ProfileTableHeaderViewDelegate?

    var title: String = ""
    
    
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
        titleName.textAlignment = .left
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
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: setStatusView.frame.height))
        setStatusView.leftView = paddingView
        setStatusView.leftViewMode = UITextField.ViewMode.always
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
    
    var ghostView: UIView = {
        let ghostView = UIView()
        ghostView.backgroundColor = .white
        ghostView.alpha = 0
        ghostView.translatesAutoresizingMaskIntoConstraints = false
        return ghostView
    }()
    
    var closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.setBackgroundImage(UIImage(systemName: "clear"), for: .normal)
        closeButton.alpha = 0
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        return closeButton
    }()
    
    @objc func actionButton() {
        commentView.text = title
    }
    
    
    @objc func statusSet(_ textField: UITextField) {
        title = setStatusView.text ?? ""
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        animated()
        closeAnimated()

        addSubview(button)
        addSubview(titleName)
        addSubview(commentView)
        addSubview(setStatusView)
        addSubview(ghostView)
        addSubview(avatarImage)
        addSubview(closeButton)
     
             ghostView.translatesAutoresizingMaskIntoConstraints = false
             closeButton.translatesAutoresizingMaskIntoConstraints = false

        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        titleName.translatesAutoresizingMaskIntoConstraints = false
        commentView.translatesAutoresizingMaskIntoConstraints = false
        setStatusView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
      
            NSLayoutConstraint.activate([

                avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
                avatarImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                avatarImage.heightAnchor.constraint(equalToConstant: 120),
                avatarImage.widthAnchor.constraint(equalTo: avatarImage.heightAnchor),
                
                titleName.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
                titleName.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
                titleName.heightAnchor.constraint(equalToConstant: 18),
                
                button.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 32),
                button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                button.heightAnchor.constraint(equalToConstant: 50),
                button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
                
                setStatusView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 16),
                setStatusView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                setStatusView.bottomAnchor.constraint(equalTo: button.topAnchor, constant: -10),
                setStatusView.heightAnchor.constraint(equalToConstant: 40),
                
                commentView.leadingAnchor.constraint(equalTo: avatarImage.trailingAnchor, constant: 20),
                commentView.bottomAnchor.constraint(equalTo: setStatusView.topAnchor, constant: -20),
                commentView.heightAnchor.constraint(equalToConstant: 20),
                
            ])
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        ghostViewSetup()
    }
    
    
    func ghostViewSetup()  {
       
        if let viewNew = delegate?.viewW {
        ghostView.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                ghostView.bottomAnchor.constraint(equalTo: viewNew.bottomAnchor),
                ghostView.leadingAnchor.constraint(equalTo: viewNew.leadingAnchor),
                ghostView.trailingAnchor.constraint(equalTo: viewNew.trailingAnchor),
                ghostView.topAnchor.constraint(equalTo: viewNew.topAnchor),
    
                closeButton.topAnchor.constraint(equalTo: viewNew.safeAreaLayoutGuide.topAnchor, constant: 20),
                closeButton.trailingAnchor.constraint(equalTo: viewNew.trailingAnchor, constant: -20),
                closeButton.widthAnchor.constraint(equalToConstant: 30),
                closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
        ])
        }
    }
    
    func animated() {
          let tapAvatarImage = UITapGestureRecognizer(target: self, action: #selector(tapAvatar))
          avatarImage.addGestureRecognizer(tapAvatarImage)
          avatarImage.isUserInteractionEnabled = true
      }
  
      @objc func tapAvatar() {
          let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
            self.avatarImage.center = CGPoint(x: self.frame.width/2, y: self.frame.height * 2 - 60)
              self.avatarImage.transform = CGAffineTransform.init(scaleX: 1.01 , y: 1.01 )
              self.avatarImage.bounds = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.width)
              self.avatarImage.layer.cornerRadius = 0
              self.ghostView.alpha = 0.7
              self.ghostView.isUserInteractionEnabled = true
            self.delegate?.tableW?.isScrollEnabled = false
            self.delegate?.tableW?.allowsSelection = false
          }
  
          animator.startAnimation()
  
          let animator2 = UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
              self.closeButton.alpha = 1
          }
          animator2.startAnimation(afterDelay: 0.5)
      }
    
    func closeAnimated() {
            let tapCloseButton = UITapGestureRecognizer(target: self, action: #selector(tapButton))
            closeButton.addGestureRecognizer(tapCloseButton)
        }
    
        @objc func tapButton() {
            let animator = UIViewPropertyAnimator(duration: 0.3, curve: .linear) {
                self.closeButton.alpha = 0
            }
            animator.startAnimation()
    
            let animator2 = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
                self.ghostView.alpha = 0
                self.avatarImage.frame = CGRect(x: 16, y: 16, width: 120, height: 120)
                self.avatarImage.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                self.avatarImage.layer.masksToBounds = true
                self.avatarImage.layer.cornerRadius = 60
                self.avatarImage.layer.borderWidth = 3
                self.ghostView.isUserInteractionEnabled = false
                self.delegate?.tableW?.isScrollEnabled = true
                self.delegate?.tableW?.allowsSelection = true


            }
            animator2.startAnimation(afterDelay: 0.3)
        }
}

    
    
    
   
