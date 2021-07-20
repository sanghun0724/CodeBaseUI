//
//  CollectionViewCell.swift
//  tutorial
//
//  Created by sangheon on 2021/07/19.
//

import UIKit

class CollectionViewCell:UICollectionViewCell {
    
    var item:String? {
        didSet {
            label.text = item
        }
    }
    //MARK: Properties
    lazy var label:UILabel = {
        let label = UILabel()
        return label
    }()
    
    
    //MARK:init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ConfigureVIew
    
    func configure() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
    }
}
