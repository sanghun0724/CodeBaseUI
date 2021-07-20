//
//  ModalView.swift
//  tutorial
//
//  Created by sangheon on 2021/07/20.
//

import UIKit

protocol ModalViewProtocol {
    func modalTapped()
}

class ModalView:UIView {
    
    var delegate:ModalViewProtocol?

    //MARK: properties
    lazy var closedButton:UIButton = {
    let button = UIButton()
        button.setTitle("close", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(closedButtonTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    //MARK:Selector
    @objc func closedButtonTapped() {
        self.delegate?.modalTapped()
            
    }
    
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Configure
    func configureView() {
        self.backgroundColor = .systemBlue
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        
        self.addSubview(closedButton)
        closedButton.translatesAutoresizingMaskIntoConstraints = false
        closedButton.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        closedButton.centerYAnchor.constraint(equalTo: self.bottomAnchor,constant: -55).isActive = true 
    }
}


