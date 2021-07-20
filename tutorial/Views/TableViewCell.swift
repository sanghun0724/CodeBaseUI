//
//  TableViewCell.swift
//  tutorial
//
//  Created by sangheon on 2021/07/19.
//

import UIKit

class TableViewCell:UITableViewCell {
    //MARK: -Properties
    var Items:String? {
        didSet {
            print("its work")
            self.label.text = Items
        }
    }
    
    lazy var label:UILabel = {
       let label = UILabel()
        label.textColor = .systemPink
        return label
    }()
    
    
    //MARK: init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("cellcellcell")
        configureView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Helper
    func configureView() {
        backgroundColor = .systemBackground
    
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        
        
    }
    
    
    
}
