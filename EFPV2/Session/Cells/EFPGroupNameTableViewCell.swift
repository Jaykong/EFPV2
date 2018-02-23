//
//  EFPGroupNameTableViewCell.swift
//  EFPV2
//
//  Created by JayKong on 2018/2/22.
//  Copyright © 2018 JayKong. All rights reserved.
//

import UIKit

class EFPGroupNameTableViewCell: UITableViewCell {
    var titleLbl = UILabel()
    var groupNameLbl = UILabel()
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(titleLbl)
        contentView.addSubview(groupNameLbl)
        titleLbl.snp.makeConstraints { (make) in
            make.leadingMargin.equalToSuperview()
            make.trailing.equalTo(groupNameLbl)
            make.centerY.equalToSuperview()
        }
        
        groupNameLbl.snp.makeConstraints { (make) in
            make.trailingMargin.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
