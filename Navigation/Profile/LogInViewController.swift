//
//  LogInViewController.swift
//  Navigation
//
//  Created by Fedor Boriskin on 13.07.2021.
//  Copyright © 2021 Artem Novichkov. All rights reserved.
//

import UIKit
import FirebaseAuth

class LogInViewController: UIViewController {
    
    weak var loginFactory: MyLoginFactory?
    
    var delegate: LogInViewControllerDelegate?
        
    let scrollView = UIScrollView()
    
    var logoImage: UIImageView = {
        let logoImage = UIImageView()
        logoImage.image = UIImage(named: "logo")
        return logoImage
    }()
    
    var bruteForce = BruteForce()
    
    var activiIndicator: UIActivityIndicatorView = {
        let activiIndicator = UIActivityIndicatorView()
        activiIndicator.color = .red
        return activiIndicator
    }()
    
    var crackButton: UIButton = {
        let crackButton = UIButton()
        crackButton.setTitle("☠️", for: .normal)
        crackButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        crackButton.addTarget(self, action: #selector(crackFunck), for: .touchUpInside)
        return crackButton
    }()
    
    @objc func crackFunck() {
        activiIndicator.isHidden = false
        activiIndicator.startAnimating()
        let quequ = DispatchQueue(label: "MyDispatchQueue", qos: .background)
        
        quequ.async {
            self.bruteForce.bruteForce(passwordToUnlock: "222") 
            DispatchQueue.main.async {
                self.activiIndicator.isHidden = true
                self.activiIndicator.stopAnimating()
                self.passwordTextField.text = self.bruteForce.correctCrack
                self.passwordTextField.isSecureTextEntry = false
            }
        }
    }
    var timer = Timer()
    
    var zeroTime = 0
    
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
    
    private lazy var logInButton: CustomButton = {
        let logInButton = CustomButton(title: "Log In", titleColor: .white) { [self] in

            #if DEBUG
            let userService = TestUserService()
            #else
            let userService = CurrentUserService()
            #endif
    
            if let username = emailPhoneTextField.text,
               let inspector = loginFactory?.factoryLogin,
            inspector().checkLoginPass(enterLogin: username, enterPass: passwordTextField.text ?? "") == true {
                let profileVC = ProfileViewController(userServiceProperty: userService, userName: username)
                navigationController?.pushViewController(profileVC, animated: true)
            } else {
               print("incorrect")
            }
        }
        
        logInButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        logInButton.layer.masksToBounds = true
        logInButton.layer.cornerRadius = 10
        return logInButton
    }()
    
    var timerLabel: UILabel = {
        let timerLabel = UILabel()
        timerLabel.text = ""
        timerLabel.font = UIFont.systemFont(ofSize: 16)
        return timerLabel
    }()

    var newButton: UIButton = {
        let newButton = UIButton()
        newButton.backgroundColor = .purple
        newButton.setTitle("Let's Go Firebase", for: .normal)
        newButton.setTitleColor(.white, for: .normal)
        newButton.layer.masksToBounds = true
        newButton.layer.cornerRadius = 10
        newButton.addTarget(self, action: #selector(newButtonTapped), for: .touchUpInside)
        return newButton
    }()
    
 
    @objc func newButtonTapped() {
        guard let email = emailPhoneTextField.text, !email.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
                  let alert = UIAlertController(title: "No data",
                                                message: "please enter all data",
                                                preferredStyle: .alert)

                  alert.addAction(UIAlertAction(title: "Continue",
                                                style: .cancel))

                  present(alert, animated: true)
                  return
              }

        
        if let inspector = loginFactory?.factoryLogin {
            inspector().newButtonTapped(emailLogin: email, passwordLogin: password) { checking in
                switch checking {
                case .loginError:
                    let alert = UIAlertController(title: "Account not found",
                                                  message:  "Create account?",
                                                  preferredStyle: .alert )
            
                    alert.addAction(UIAlertAction(title: "Continue",
                                                  style: .default,
                                                  handler: { _ in
                        inspector().showCreateAccount(email: email, password: password) { createCheck in
                            switch createCheck {
                            case .good:
                                
                                #if DEBUG
                                let userService = TestUserService()
                                #else
                                let userService = CurrentUserService()
                                #endif
                                
                                let profileVC = ProfileViewController(userServiceProperty: userService, userName: email)
                                self.navigationController?.pushViewController(profileVC, animated: true)
                            case .error:
                                print("Account creation false")
                            }
                        }
                    }))
                    alert.addAction(UIAlertAction(title: "Cancel",
                                                  style: .cancel,
                                                  handler: { _ in
                    }))
                    self.present(alert, animated: true)
                
                case .loginGood:
                    print("YRAAAA")
                    
                    #if DEBUG
                    let userService = TestUserService()
                    #else
                    let userService = CurrentUserService()
                    #endif

                    let profileVC = ProfileViewController(userServiceProperty: userService, userName: email)
                    self.navigationController?.pushViewController(profileVC, animated: true)
                    }
                }
            }
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
        scrollView.addSubview(crackButton)
        scrollView.addSubview(activiIndicator)
        scrollView.addSubview(timerLabel)
        scrollView.addSubview(newButton)
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setTimer()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        cancelTimer()
        
        
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
        crackButton.translatesAutoresizingMaskIntoConstraints = false
        activiIndicator.translatesAutoresizingMaskIntoConstraints = false
        timerLabel.translatesAutoresizingMaskIntoConstraints = false
        newButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            logInButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            newButton.topAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 16),
            newButton.heightAnchor.constraint(equalToConstant: 50),
            newButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            newButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),

            
            crackButton.bottomAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 150),
            crackButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            crackButton.widthAnchor.constraint(equalToConstant: 50),
            crackButton.heightAnchor.constraint(equalTo: crackButton.widthAnchor),
            
            activiIndicator.bottomAnchor.constraint(equalTo: logInButton.bottomAnchor, constant: 90),
            activiIndicator.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            activiIndicator.widthAnchor.constraint(equalToConstant: 20),
            activiIndicator.heightAnchor.constraint(equalTo: crackButton.widthAnchor),
            
            timerLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 80),
            timerLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
           
        
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setTimer() {
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.zeroTime += 1
            let time = self.secondToMinutes(seconds: self.zeroTime)
            let timeString = self.makeTimeString(minutes: time.0, seconds: time.1)
            self.timerLabel.text = timeString
        }
        timer.fire()
    }
    
    func secondToMinutes(seconds: Int) -> (Int, Int) {
       return (((seconds % 3600) / 60), ((seconds % 3600) % 60))
    }
    
    func makeTimeString(minutes: Int, seconds: Int) -> String {
        var timeString = ""
        timeString += String(format: "%02d", minutes)
        timeString += ":"
        timeString += String(format: "%02d", seconds)
        return timeString
    }
    
    func cancelTimer(){
    timer.invalidate()
        self.zeroTime = 0
    }
    
}
