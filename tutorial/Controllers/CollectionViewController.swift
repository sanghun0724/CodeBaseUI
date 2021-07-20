//
//  CollectionViewController.swift
//  tutorial
//
//  Created by sangheon on 2021/07/19.
//

import UIKit

private let reusableIdentifier = "collect"

//콜렉션뷰는 테이블뷰와 다르게 레이아웃을 지정 해줘야함 
class CollectionViewController:UICollectionViewController {
    //MARK:Properties
    let Items:[String] = ["1","2","3","4","5","6","7","8","9"]
    
    //MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        print("cllection")
        configureView()
    }
    
    
    
    //MARK: Configure
    func configureView() {
        self.view.backgroundColor = .systemBackground
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: reusableIdentifier)
    }
}

extension CollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:reusableIdentifier, for: indexPath) as! CollectionViewCell
        
        let item = self.Items[indexPath.row]
        cell.item = item
        
        return cell 
        
    }
    
}
