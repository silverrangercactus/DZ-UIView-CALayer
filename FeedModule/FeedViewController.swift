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

    //var checkerr: RandomWord
    
    private var viewModel: FeedViewOutput

    init(//checkerr: RandomWord,
        viewModel: FeedViewOutput) {
       // self.checkerr = checkerr
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var someText: String = ""
    
    private lazy var someButton: CustomButton = {
        let someButton = CustomButton(title: "Touch Me", titleColor: .white) {
            self.checkYourWord()
        }
        someButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        someButton.layer.masksToBounds = true
        someButton.layer.cornerRadius = 10
        return someButton
    }()
        
    private func checkYourWord() {
        imputData()
    }
    
    
    var someTextField: CustomTextField = {
        let someTextField = CustomTextField(textColor: .black, backgroundColor: .systemGray5, placeholderText: "^_^")
        someTextField.addTarget(self, action: #selector(saveSomeCustomTextFieldText), for: .editingChanged)
        return someTextField
    }()
    
    @objc func saveSomeCustomTextFieldText() {
        someText = someTextField.text ?? ""
        
    }
    
    private func imputData() {
        viewModel.updateText(someText) { checking in
                switch checking {
                case .pox:
                    self.someLabel.text = "No Text"
                    self.someLabel.textColor = .purple
                case .good:
                    self.someLabel.text = self.someText
                    self.someLabel.textColor = .green
                case .bad:
                    self.someLabel.text = self.someText
                    self.someLabel.textColor = .red
                }
            }
    }
    
    var someLabel: UILabel = {
        let someLabel = UILabel()
        someLabel.backgroundColor = .white
        someLabel.textAlignment = .center
        return someLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
    
    override func viewWillLayoutSubviews() {
        view.addSubview(someButton)
        view.addSubview(someTextField)
        view.addSubview(someLabel)
        
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
        
        someLabel.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(someTextField.snp.bottom).offset(50)
        }
    }
}
