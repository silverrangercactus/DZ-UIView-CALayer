//
//  LogInViewController.swift
//  Navigation
//
//  Created by Fedor Boriskin on 13.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let scrollView = UIScrollView()
    
    var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        return logoImage
    }()
    
    
    var emailPhoneTextField: UITextField = {
        let emailPhoneTextField = UITextField()
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: emailPhoneTextField.frame.height))
        emailPhoneTextField.leftView = paddingView
        emailPhoneTextField.leftViewMode = UITextField.ViewMode.always
        emailPhoneTextField.backgroundColor = .systemGray6
        emailPhoneTextField.placeholder = "Email or phone"
        emailPhoneTextField.layer.masksToBounds = true
        emailPhoneTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        emailPhoneTextField.layer.borderWidth = 0.5
        emailPhoneTextField.layer.cornerRadius = 10
        emailPhoneTextField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        emailPhoneTextField.textColor = .black
        emailPhoneTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        emailPhoneTextField.tintColor = .purple // не понял, что это
        emailPhoneTextField.autocapitalizationType = .none
        return emailPhoneTextField
    }()
    
    
    var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        let paddingVIew = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: passwordTextField.frame.height))
        passwordTextField.leftView = paddingVIew
        passwordTextField.leftViewMode = UITextField.ViewMode.always
        passwordTextField.backgroundColor = .systemGray6
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.backgroundColor = UIColor.systemGray6.cgColor
        passwordTextField.layer.borderWidth = 0.5
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        passwordTextField.textColor = .black
        passwordTextField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        passwordTextField.tintColor = .purple // не понял, что это
        passwordTextField.autocapitalizationType = .none
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    
    var logInButton: UIButton = {
        let logInButton = UIButton()
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.layer.masksToBounds = true
        logInButton.layer.cornerRadius = 10
        logInButton.setTitle("Log In", for: .normal)
        logInButton.addTarget(self, action: #selector(openProfileHeaderView), for: .touchUpInside)
        return logInButton
    }()
    
    var currentUserService = CurrentUserService()
    var testUserService = TestUserService()
    
    
    @objc func openProfileHeaderView() {
        
        #if DEBUG
        if let userName = emailPhoneTextField.text {
            let profileVC = ProfileViewController(userServiceProperty: testUserService, userName: userName)
                navigationController?.pushViewController(profileVC, animated: true)
            }
        #else
        if let userName = emailPhoneTextField.text,
           let _ = currentUserService.returnUser(name: userName) {
                let profileVC = ProfileViewController(userServiceProperty: currentUserService, userName: userName)
                navigationController?.pushViewController(profileVC, animated: true)
        } else {
            print("Error")
        }
        #endif
}

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .white
    }
    
    override func viewWillLayoutSubviews() {
        view.addSubview(scrollView)
        
        scrollView.keyboardDismissMode = .onDrag
        
        scrollView.addSubview(logoImage)
        scrollView.addSubview(emailPhoneTextField)
        scrollView.addSubview(passwordTextField)
        scrollView.addSubview(logInButton)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
    fileprivate func setupViews() {
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        emailPhoneTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        
        scrollView.isScrollEnabled = true
   
        let constraints = [
            
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            
            logoImage.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 120),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 100),
            logoImage.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            
            emailPhoneTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
            emailPhoneTextField.heightAnchor.constraint(equalToConstant: 50),
            emailPhoneTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            emailPhoneTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            emailPhoneTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32),
            
            
            passwordTextField.topAnchor.constraint(equalTo: emailPhoneTextField.bottomAnchor, constant: 0),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            passwordTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            
            
            logInButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            logInButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}
