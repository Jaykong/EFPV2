//
//  EFPGroupMemberIconCollectionViewCell.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/22.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit
import SnapKit
class EFPGroupMemberIconCollectionViewCell: UICollectionViewCell {
    let imageView:UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "group_icon")
        return imageView
    }()
    let nameLbl: UILabel = {
        var lbl = UILabel()
        lbl.numberOfLines = 0
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLbl)
        
        imageView.snp.makeConstraints { (make) in
            
            make.centerX.equalToSuperview()
            make.topMargin.equalToSuperview().inset(5)
            make.width.equalTo(imageView.snp.height)
            make.bottom.equalTo(nameLbl.snp.top).inset(-5)
            
        }
        nameLbl.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(-5)
        }
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
