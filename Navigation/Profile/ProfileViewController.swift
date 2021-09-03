//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.06.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileTableHeaderViewDelegate {
    
    var tableW: UITableView?
    
    var viewW: UIView?
  
    var tableView = UITableView(frame: .zero, style: .grouped)
    var cellID = "cellID"
    var cellID1 = "cellID1"
    
    var profileTableHederView = ProfileTableHederView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupConstraints()
    }

    func setupTableView() {
        view.addSubview(tableView)

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
        ]
        NSLayoutConstraint.activate(constraints)
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
            headerView.delegate = self
            headerView.delegate?.viewW = view
            headerView.delegate?.tableW = self.tableView
            return headerView
        } else {
            return .none
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
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

