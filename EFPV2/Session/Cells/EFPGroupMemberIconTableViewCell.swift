//
//  EFPGroupMemberIconTableViewCell.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/22.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit
import SnapKit

class MemberCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: 80, height: 80)
        minimumLineSpacing = 0
        minimumInteritemSpacing = 0
        scrollDirection = .vertical
    }
}

class EFPGroupMemberIconTableViewCell: UITableViewCell {
    let collectionView:UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: MemberCollectionViewFlowLayout())
        collectionView.backgroundColor = UIColor.clear
        
        return collectionView
    }()
    var dataSource:UICollectionViewDataSource?
    var delegate:UICollectionViewDelegate?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        collectionView.dataSource = dataSource
        collectionView.delegate = delegate
        collectionView.register(cellWithClass: EFPGroupMemberIconCollectionViewCell.self)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
