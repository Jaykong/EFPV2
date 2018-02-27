//
//  EFPSearchResultCell.swift
//
//
//  Created by JayKong on 2018/2/15.
//

import UIKit
import SnapKit
class EFLocalMessageSearchResultCell: UITableViewCell {
    
    var avatarImageView = NIMAvatarImageView()
    var titleLbl = UILabel()
    var messageLbl = UILabel()
    var timeStampLbl = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(avatarImageView)
        contentView.addSubview(titleLbl)
        contentView.addSubview(messageLbl)
        contentView.addSubview(timeStampLbl)
        
        avatarImageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.width.equalTo(avatarImageView.snp.height)
            make.centerY.equalToSuperview()
            make.height.equalTo(contentView.snp.height)
        }
        titleLbl.snp.makeConstraints { (make) in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(8)
            make.trailing.equalTo(timeStampLbl.snp.leading).priority(.low)
            make.topMargin.equalTo(contentView.snp.topMargin)
            make.bottom.equalTo(messageLbl.snp.top).offset(-5)
            
        }
        
        messageLbl.snp.makeConstraints { (make) in
            make.leading.equalTo(titleLbl.snp.leading)
            make.bottom.equalToSuperview()
        }
        
       
        timeStampLbl.snp.makeConstraints { (make) in
            make.trailingMargin.equalTo(contentView.snp.trailingMargin).priority(.high)
            make.top.equalTo(titleLbl.snp.top)
            
        }
    }
    
    func configure(withViewModel viewModel:EFPGroupSearchCellViewModel) {
        let item = viewModel.item
        avatarImageView.image = item.avtarImage
        titleLbl.text = item.senderName
        messageLbl.attributedText = item.content
        timeStampLbl.text = item.timeStamp
        
        
        
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func prepareForReuse() {
        
    }
}


