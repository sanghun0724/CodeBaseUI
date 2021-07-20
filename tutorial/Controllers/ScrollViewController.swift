//
//  ScrollViewController.swift
//  tutorial
//
//  Created by sangheon on 2021/07/18.
//

import UIKit

class ScrollViewController:UIViewController {
    
    //MARK: Properties
    lazy var scrollView:UIScrollView = {
        let v = UIScrollView()
        v.backgroundColor = .systemBackground
        v.contentSize = CGSize(width: view.frame.width, height: 2000)
        return v
    }()
    
    lazy var labelOne:UILabel = {
        let label = UILabel()
        label.text = "Top"
        return label
    }()
    
    lazy var labelTwo:UILabel = {
      let label = UILabel()
        label.text = "Bottom"
        return label
    }()
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewComponent()
    }
    
    func configureViewComponent() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.topAnchor.constraint(equalTo:  view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        scrollView.addSubview(labelOne)
        labelOne.translatesAutoresizingMaskIntoConstraints = false
        labelOne.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 100).isActive = true
        labelOne.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
        scrollView.addSubview(labelTwo)
        labelTwo.translatesAutoresizingMaskIntoConstraints = false 
        labelTwo.topAnchor.constraint(equalTo: labelOne.bottomAnchor,constant: 1500).isActive = true
        labelTwo.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        
    }
}
