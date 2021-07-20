//
//  CollectionViewHeaderView.swift
//  tutorial
//
//  Created by sangheon on 2021/07/20.
//

import UIKit

class CollectionViewHeaderView:UICollectionReusableView {
    
    //MARK: properties
    
    lazy var label:UILabel = {
        let label = UILabel()
        label.text = "HEADER"
        return label
    }()
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        backgroundColor = .systemBackground
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true 
    }
}



