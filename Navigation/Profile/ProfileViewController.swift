//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
   let profileView = ProfileHeaderView()
    
    var newButton: UIButton = {
        let newButton = UIButton()
        newButton.setTitle("New button", for: .normal)
        newButton.backgroundColor = .systemPink
        newButton.layer.cornerRadius = 10
        return newButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
       
    }
      
   
    override func viewWillLayoutSubviews() {
        view.addSubview(profileView)
        view.addSubview(newButton)

        
        newButton.translatesAutoresizingMaskIntoConstraints = false
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            newButton.heightAnchor.constraint(equalToConstant: 40),
            
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileView.bottomAnchor.constraint(equalTo: newButton.topAnchor)
            ])
        
    }
  
}
