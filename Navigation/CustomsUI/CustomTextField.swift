//
//  CustomTextField.swift
//  Navigation
//
//  Created by Fedor Boriskin on 28.10.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField: UITextField {
    
    init(textColor: UIColor, backgroundColor: UIColor, placeholderText: String){
        super.init(frame: .zero)
        
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        let placeholder = placeholderText
        let centeredPlaceholder = NSMutableParagraphStyle()
            centeredPlaceholder.alignment = .center
            self.attributedPlaceholder = NSAttributedString(
               string: placeholder,
               attributes: [.paragraphStyle: centeredPlaceholder])
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = UITextField.ViewMode.always
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}





