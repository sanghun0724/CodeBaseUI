//
//  RootViewController.swift
//  tutorial
//
//  Created by sangheon on 2021/07/18.
//

import UIKit

class RootViewController:UIViewController {
    
    //MARK: -Properties
    lazy var mainLabel:UILabel = {
       let label = UILabel()
       label.font = UIFont.boldSystemFont(ofSize: 30)
        label.text = "Treduler"
       return label
    }()
    
    lazy var loginLabel:UILabel = {
        let label = UILabel()
        label.text = "login"
        return label
    }()
    lazy var idTextView:UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.borderWidth = 1
        view.addSubview(idTextField)
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        idTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        idTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        idTextField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10).isActive = true
        idTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return view
    }()
    
    lazy var idTextField:UITextField = {
        let id = UITextField()
        id.placeholder = "ID"
        return id
    }()
    
    lazy var pwTextView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderColor = UIColor.tertiarySystemGroupedBackground.cgColor
        view.layer.borderWidth = 1
        view.addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10).isActive = true
        passwordTextField.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        return view
    }()
    
    lazy var passwordTextField:UITextField = {
       let password = UITextField()
        password.placeholder = "PW"
        password.isSecureTextEntry = true
        return password
    }()
    
    lazy var loginButton:UIButton = {
       let button = UIButton()
        button.setTitle("Login", for: UIControl.State.normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(loginButtonTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        self.hideKeyboardWhenTappedAround()
        self.moveViewWithKeyboard()
    }
    
   
    
    //MARK: Override
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        configureColors()
    }
    
    //MARK: Selector
    @objc func loginButtonTapped() {
        self.navigationController?.pushViewController(ScrollViewController(), animated: true)
    }
    
    
    //MARK: Helper
    func configureColors() {
        if self.traitCollection.userInterfaceStyle == .dark {
            loginButton.setTitleColor(UIColor.black, for: UIControl.State.normal)
            loginButton.backgroundColor = .white
            
        } else {
            loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
            loginButton.backgroundColor = .black
        }
    }
    
    
    
    func configureView() {
        view.backgroundColor = .systemBackground
        
        self.view.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mainLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
        self.view.addSubview(loginLabel)
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 10).isActive = true
        
        self.view.addSubview(idTextView)
        idTextView.translatesAutoresizingMaskIntoConstraints = false
        idTextView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        idTextView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        idTextView.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 40).isActive = true
        idTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.view.addSubview(pwTextView)
        pwTextView.translatesAutoresizingMaskIntoConstraints = false
        pwTextView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        pwTextView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        pwTextView.topAnchor.constraint(equalTo: idTextView.bottomAnchor,constant: 20).isActive = true
        pwTextView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        self.view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: pwTextView.bottomAnchor, constant: 40).isActive = true
        loginButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 30).isActive = true
        loginButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -30).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        configureColors()
        
    }
}
