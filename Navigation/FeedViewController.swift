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

    var checkerr: RandomWord

    init(checkerr: RandomWord) {
        self.checkerr = checkerr
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var namesTableView = UITableView(frame: .zero, style: .plain)
    var cellID = "cellID"
    
    var arrayNames: [String] = []
    let ololo = ["odin", "dva", "trhree"]

    var orbitalLabel: UILabel = {
        let orbitalLabel = UILabel()
        orbitalLabel.textColor = .red
        orbitalLabel.font = UIFont.systemFont(ofSize: 17)
        orbitalLabel.text = "Orbital period = "
        return orbitalLabel
    }()
    
    var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textColor = .blue
        titleLabel.font = UIFont.systemFont(ofSize: 17)
        return titleLabel
    }()
    
    var someText: String = ""
    
    private lazy var someButton: CustomButton = {
        let someButton = CustomButton(title: "Touch Me", titleColor: .white) { [self] in
            let wordNeedCheck = self.someText
            self.checkerr.check(word: wordNeedCheck) { [weak self] checking in
                switch checking {
                case .empty:
                    self?.someLabel.text = "No Text"
                    self?.someLabel.textColor = .purple
                case .correct:
                    self?.someLabel.text = self?.someText
                    self?.someLabel.textColor = .green
                case .incorrect:
                    self?.someLabel.text = self?.someText
                    self?.someLabel.textColor = .red
                }
            }
        }
            someButton.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
            someButton.layer.masksToBounds = true
            someButton.layer.cornerRadius = 10
        return someButton
    }()
    
    
    var someTextField: CustomTextField = {
        let someTextField = CustomTextField(textColor: .black, backgroundColor: .systemGray5, placeholderText: "^_^")
        someTextField.addTarget(self, action: #selector(saveSomeCustomTextFieldText), for: .editingChanged)
        return someTextField
    }()
    
    @objc func saveSomeCustomTextFieldText() {
        someText = someTextField.text ?? ""
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
        
        NetworkService.shared.startURLSessionDataTaskWithcJSON { human in
            DispatchQueue.main.async {
                self.titleLabel.text = human.title
            }
        }
        
        NetworkService.shared.startURLSessionDataTaskWithcCodable { planet in
            DispatchQueue.main.async {
                self.orbitalLabel.text! += planet.orbitalPeriod + " days"
            }
        }
        
        NetworkService.shared.getNamesOfPeopleDecodable { array in
            DispatchQueue.main.async {
                self.arrayNames = array
                self.namesTableView.reloadData()
            }
            
        }
     
    }
    
    override func viewWillLayoutSubviews() {
        view.addSubview(someButton)
        view.addSubview(someTextField)
        view.addSubview(someLabel)
        view.addSubview(orbitalLabel)
        view.addSubview(titleLabel)
        
        setupTableView()
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
        
        orbitalLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
            make.top.equalToSuperview().inset(150)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(50)
            make.top.equalToSuperview().inset(100)
        }
        
        namesTableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(200)
            make.top.equalToSuperview().inset(200)
        }
    }
    
    func setupTableView() {
        view.addSubview(namesTableView)
        namesTableView.dataSource = self
    }
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: cellID)
        let post = arrayNames[indexPath.row]
        cell.textLabel?.text = post
        return cell
    }
}

