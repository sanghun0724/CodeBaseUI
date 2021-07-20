//
//  AnimationViewController.swift
//  tutorial
//
//  Created by sangheon on 2021/07/20.
//

import UIKit

class AnimationViewController:UIViewController {
    
    //MARK:Properties
    lazy var OpenButton:UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(openButtonTapped), for: UIControl.Event.touchUpInside)
        button.setTitle("open", for: UIControl.State.normal)
        return button
    }()
    
    lazy var modalView:ModalView = {
        let view = ModalView()
        return view
    }()
    
    lazy var blurEffectView:UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurView = UIVisualEffectView(effect: effect)
        return blurView
    }()

    //MARK: Selector
    @objc func openButtonTapped() {
       
  
            self.view.addSubview(self.modalView)
            self.modalView.translatesAutoresizingMaskIntoConstraints = false
            self.modalView.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
            self.modalView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor,constant: -25).isActive = true
            self.modalView.heightAnchor.constraint(equalTo:self.view.heightAnchor,multiplier: 0.6).isActive = true
            self.modalView.widthAnchor.constraint(equalTo: self.view.widthAnchor,multiplier: 0.8).isActive = true
        //ANIMATION
            let translation =  CGAffineTransform(translationX: 0, y: view.frame.height)
            let rotation = CGAffineTransform(rotationAngle: .pi)
            let scale = CGAffineTransform(scaleX: 2.0, y: 2.0)
        modalView.transform = scale.concatenating(rotation).concatenating(translation)
        
        UIView.animate(withDuration: 0.5) {
            self.blurEffectView.alpha = 1
            self.modalView.transform = .identity //원래 상태로 돌아오기 
        }

    }
    
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: configure
    func configure() {
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(OpenButton)
        OpenButton.translatesAutoresizingMaskIntoConstraints = false
        OpenButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        OpenButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        
        self.view.addSubview(blurEffectView)
        blurEffectView.translatesAutoresizingMaskIntoConstraints = false
        blurEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blurEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        blurEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        blurEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        blurEffectView.alpha = 0
    }
    
    
    
}
