//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {

    private lazy var photoCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let photoCollection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        photoCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: PhotosCollectionViewCell.self))
        photoCollection.dataSource = self
        photoCollection.backgroundColor = .white
        photoCollection.delegate = self
        return photoCollection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Photo Gallery"
        view.backgroundColor = .white
        
        setupTableView()
        setupConstraints()
       
    }
    
   
    func setupTableView() {
        view.addSubview(photoCollection)
        self.navigationController?.isNavigationBarHidden = false

        photoCollection.translatesAutoresizingMaskIntoConstraints = false
    }
    
        func setupConstraints() {
            let constraints = [
                photoCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                photoCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                photoCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                photoCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
            ]
            NSLayoutConstraint.activate(constraints)
        }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
    
extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoView.allPhoto[section].photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photoCollection.dequeueReusableCell(withReuseIdentifier: String(describing: PhotosCollectionViewCell.self), for: indexPath) as! PhotosCollectionViewCell
        cell.photo = PhotoView.allPhoto[indexPath.section].photos[indexPath.row]
        return cell
    }
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 8 * 4) / 3, height: (collectionView.frame.width - 8 * 4) / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: CGFloat(8), left: CGFloat(8), bottom: CGFloat(8), right: CGFloat(8))
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }
}

