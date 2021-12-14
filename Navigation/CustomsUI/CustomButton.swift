//
//  CustomButton.swift
//  Navigation
//
//  Created by Fedor Boriskin on 27.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//
import UIKit
import Foundation

class CustomButton: UIButton {
    
    var buttonTarget: () -> Void

    init(title: String?, titleColor: UIColor?, buttonTarget: @escaping () -> Void) {
        self.buttonTarget = buttonTarget
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc private func buttonTapped() {
        self.buttonTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
