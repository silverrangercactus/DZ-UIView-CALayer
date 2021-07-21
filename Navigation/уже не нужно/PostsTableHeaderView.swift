////
////  PostsTableHeaderView.swift
////  Navigation
////
////  Created by Fedor Boriskin on 20.07.2021.
////  Copyright © 2021 Artem Novichkov. All rights reserved.
////
//
//import UIKit
//
//class PostsTableHeaderView: UITableViewHeaderFooterView {
//
//    var section: PostSection? {
//        didSet {
//         //   headerImageView.image = section?.posts.last?.image
//            titleLabel.text = section?.title
//        }
//    }
//
//
////    private let headerImageView: UIImageView = {
////        let imageView = UIImageView()
////        imageView.contentMode = .scaleAspectFill
////        imageView.translatesAutoresizingMaskIntoConstraints = false
////        return imageView
////    }()
//
//    private let titleLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .blue
//        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//
//    override init(reuseIdentifier: String?) {
//        super.init(reuseIdentifier: reuseIdentifier)
//        setupViews()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
////        headerImageView.layer.cornerRadius = 60/2
////        headerImageView.clipsToBounds = true
//    }
//
//    fileprivate func setupViews() {
//       // contentView.addSubview(headerImageView)
//        contentView.addSubview(titleLabel)
//
//        let constraints = [
////            headerImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
////            headerImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
////            headerImageView.widthAnchor.constraint(equalToConstant: 60),
////            headerImageView.heightAnchor.constraint(equalTo: headerImageView.widthAnchor),
////            headerImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
//
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
//            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ]
//
//        NSLayoutConstraint.activate(constraints)
//    }
//}
//
