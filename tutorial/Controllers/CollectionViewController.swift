//
//  CollectionViewController.swift
//  tutorial
//
//  Created by sangheon on 2021/07/19.
//

import UIKit

private let reusableIdentifier = "collect"
private let reusableHeaderIdentifier = "header"

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
        collectionView.register(CollectionViewHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reusableHeaderIdentifier)
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
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reusableHeaderIdentifier, for: indexPath) as! CollectionViewHeaderView
        
        return cell
    }
    
//    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        if kind == UICollectionView.elementKindSectionHeader {
//            //header 여기서 반환
//        } else {
//            //false 여기서 반환
//        }
//    }
    
}

extension CollectionViewController:UICollectionViewDelegateFlowLayout {
    
    //cell size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.view.frame.width / 3) - 2, height: (self.view.frame.width) / 3 - 2)
    }
    
    //가로 간격 아이템 항목 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //줄 간격 세로 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    //HEADER Size!!
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width - 2, height: ((view.frame.width - 2)/3*2))
    }
    
    
    
}
