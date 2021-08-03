//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
        
    var tableView = UITableView(frame: .zero, style: .grouped)
    var cellID = "cellID"
    var cellID1 = "cellID1"
    
    var profileTableHederView = ProfileTableHederView()
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupConstraints()
        animated()
        closeAnimated()

    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.addSubview(ghostView)
        view.addSubview(closeButton)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: cellID1)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
    }
        
    func setupConstraints() {
        let constraints = [
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            ghostView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            ghostView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            ghostView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            ghostView.topAnchor.constraint(equalTo: self.view.topAnchor),
            
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.widthAnchor.constraint(equalToConstant: 30),
            closeButton.heightAnchor.constraint(equalTo: closeButton.widthAnchor),
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func animated() {
        let tapAvatarImage = UITapGestureRecognizer(target: self, action: #selector(tapAvatar))
        profileTableHederView.avatarImage.addGestureRecognizer(tapAvatarImage)
        profileTableHederView.avatarImage.isUserInteractionEnabled = true
    }
    
    @objc func tapAvatar() {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear) {
            self.profileTableHederView.avatarImage.center = self.view.center
            self.profileTableHederView.avatarImage.transform = CGAffineTransform.init(scaleX: 1.01 , y: 1.01 )
            self.profileTableHederView.avatarImage.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width)
            self.profileTableHederView.avatarImage.layer.cornerRadius = 0
            self.ghostView.alpha = 0.7
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
            self.profileTableHederView.avatarImage.frame = CGRect(x: 16, y: 20, width: 120, height: 120)
            self.profileTableHederView.avatarImage.transform = CGAffineTransform.init(scaleX: 1, y: 1)
            self.profileTableHederView.avatarImage.layer.masksToBounds = true
            self.profileTableHederView.avatarImage.layer.cornerRadius = 60
            self.profileTableHederView.avatarImage.layer.borderWidth = 3
        }
        animator2.startAnimation(afterDelay: 0.3)
    }
    
}


extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cellPhoto = tableView.dequeueReusableCell(withIdentifier: cellID1) as! PhotoTableViewCell
            cellPhoto.photo = PhotoView.allPhoto[0].photos[indexPath.row]
            return cellPhoto
        } else {
            let cellPost = tableView.dequeueReusableCell(withIdentifier: cellID) as! PostTableViewCell
            cellPost.posts = PostView.tableModel[0].posts[indexPath.row]
            return cellPost
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 { return 1  }
        else { return 4 }
    }
}


extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let headerView = profileTableHederView
            return headerView
        } else {
            return .none
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         if section == 0 {
             return 210 // хотелось бы задать высоту через ProfileTableHederView или UITableView.automaticDimension
         } else {
             return 0
         }
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
        let photosViewController = PhotosViewController()
        navigationController?.pushViewController(photosViewController, animated: true)
        }
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            let photos = PhotoView.allPhoto[0].photos[indexPath.row]
            (cell as! PhotoTableViewCell).photo = photos
        } else {
            let posts = PostView.tableModel[0].posts[indexPath.row]
            (cell as! PostTableViewCell).posts = posts
        }
    }
}
    

