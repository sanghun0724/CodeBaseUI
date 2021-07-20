//
//  TableViewController.swift
//  tutorial
//
//  Created by sangheon on 2021/07/19.
//

import UIKit

private let reusableIdentifier = "cell"

class TableViewController:UITableViewController {
    
    let Items:[String] = ["1","2","3","4","5","6","7","8","9"]
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    //MARK: Helper
    
    func configureView() {
        
        tableView.register(TableViewCell.self, forCellReuseIdentifier: reusableIdentifier)
        print("configure")
    }
    
}

//MARK: TabelView Delegate and Datasource func
extension TableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! TableViewCell
        
        let item = self.Items[indexPath.row]
        cell.Items = item
        print("Extension")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 2 {
            return 300
        } else {
            return 100
        }
    }
}
