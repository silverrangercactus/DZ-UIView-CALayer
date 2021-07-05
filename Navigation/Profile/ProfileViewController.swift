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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        
    }
      
   
    override func viewWillLayoutSubviews() {
        view.addSubview(profileView)
        
    }
 
}
