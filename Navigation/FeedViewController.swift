//
//  ViewController.swift
//  Navigation
//
//  Created by Artem Novichkov on 12.09.2020.
//  Copyright © 2020 Artem Novichkov. All rights reserved.
//

import UIKit
import SnapKit

final class FeedViewController: UIViewController {
    
    var someButton: UIButton = {
        let someButton = UIButton()
        someButton.setTitle("Touch Me", for: .normal)
        someButton.setTitleColor(.white, for: .normal)
        someButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        someButton.layer.masksToBounds = true
        someButton.layer.cornerRadius = 10
        return someButton
    }()
    
    
    var someTextField: CustomTextField = {
        let someTextField = CustomTextField(textColor: .white, backgroundColor: .systemGray5, placeholderText: "^_^")
        return someTextField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
    
    override func viewWillLayoutSubviews() {
        view.addSubview(someButton)
        view.addSubview(someTextField)
        
        settingUI()
    }
    
    func settingUI() {
        
        someButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(50)
            make.bottom.equalToSuperview().inset(150)
        }
        
        someTextField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(16)
            make.centerY.equalTo(view.snp.centerY)
        }
    }
}
