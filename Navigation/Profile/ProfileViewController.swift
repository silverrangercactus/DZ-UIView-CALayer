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
    let headerID = "headerViewID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
        setupConstraints()
        
    }
      
   
    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        
        //зарегал кастомный Header
        //       tableView.register(PostsTableHeaderView.self, forHeaderFooterViewReuseIdentifier: headerID)
    }
        
    func setupConstraints() {
        let constraints = [
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
}


extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! PostTableViewCell
        cell.posts = PostView.tableModel[indexPath.section].posts[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PostView.tableModel[section].posts.count
    }
    
    
// для кастомного хедера
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerID) as? PostsTableHeaderView else
//        { return nil }
//        headerView.section = PostView.tableModel[section]
//        return headerView
//    }
    
     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ProfileTableHederView()
        return header
      }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 210
    }
    
}

extension ProfileViewController: UITableViewDelegate {
        func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let posts = PostView.tableModel[indexPath.section].posts[indexPath.row]

            (cell as! PostTableViewCell).posts = posts
        }
    }

